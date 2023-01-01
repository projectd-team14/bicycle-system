<?php
/*
MIT License
Copyright (c) 2021 HAYASHI-Masayuki
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
 */

namespace App\Providers;

use Illuminate\Database\Eloquent\Builder as EloquentBuilder;
use Illuminate\Database\MySqlConnection;
use Illuminate\Database\Query\Builder;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\ServiceProvider;
use LogicException;

class MySqlBulkUpdateServiceProvider extends ServiceProvider
{
    /**
     * Register bulk update methods to Query/Eloquent Builder.
     *
     * @return void
     */
    public function boot()
    {
        Builder::macro('updateBulk', function (array $values, string $column = 'id'): int {
            /** @var \Illuminate\Database\Query\Builder $this */

            if (! $this->getConnection() instanceof MySqlConnection) {
                throw new LogicException('Bulk update is only available in MySQL');
            }

            if (empty($values)) {
                return 0;
            }

            $ids = array_column($values, $column);

            $placeholders = $this->grammar->parameterize($ids);

            $assignments = [];
            $bindings    = [];

            $firstRowWithoutId = Arr::except($values[0], $column);

            foreach (array_keys($firstRowWithoutId) as $key) {
                $keyValues  = array_column($values, $key);
                $firstValue = $keyValues[0];

                $hasDifferent = array_filter($keyValues, function ($value) use ($firstValue) {
                    return $value !== $firstValue;
                });

                if ($hasDifferent) {
                    $assignments[$key] = DB::raw("elt(field({$this->grammar->wrap($column)}, {$placeholders}), {$placeholders})");
                    $bindings          = array_merge($bindings, $ids, $keyValues);
                } else {
                    $assignments[$key] = $firstValue;
                    $bindings[]        = $firstValue;
                }
            }

            $this->whereIn($column, $ids);

            $sql = $this->grammar->compileUpdate($this, $assignments);

            return $this->connection->update($sql, $this->cleanBindings(
                $this->grammar->prepareBindingsForUpdate($this->bindings, $bindings)
            ));
        });

        EloquentBuilder::macro('updateBulk', function (array $values, string $column = null): int {
            /** @var \Illuminate\Database\Eloquent\Builder $this */

            if (is_null($column)) {
                $column = $this->model->getKeyName();
            }

            $values = array_map(function ($value) {
                /** @var \Illuminate\Database\Eloquent\Builder $this */

                return $this->addUpdatedAtColumn($value);
            }, $values);

            return $this->query->updateBulk($values, $column);
        });
    }
}