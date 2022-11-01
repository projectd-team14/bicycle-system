<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <link rel="stylesheet" href="/css/style.css">
  </head>
  <body>
    <div class="container">
      <div class="row">
      @foreach($spot as $spot)
        <div class="container col-6">
          <div class="row justify-content-center">
            <div class="col-md-12">
              <div class="card">
                <div class="card-name card-header">
                  <a>{{ $spot['spots_name'] }}</a>
                  <span class="d-flex flex-row-reverse">
                    <a class="btn btn-primary m-1" href="/spot-delete/{{ $spot['id'] }}">Delete</a>
                    <!--
                    <a class="btn btn-primary m-1" href="/spot-stop/{{ $spot['id'] }}">Stop</a>
                    <a class="btn btn-primary m-1" href="/spot-start/{{ $spot['id'] }}">Start</a>   
                    --> 
                  </span>
                </div>
                <!-- 埋め込み用に変換 -->
                @php
                  $urlReplace = str_replace('watch?v=', 'embed/', $spot['spots_url']);
                @endphp
                <div class="m-2 ms-5">
                <iframe width="92%" height="315" 
                src="{{ $urlReplace }}" title="YouTube video player" 
                frameborder="0" 
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                allowfullscreen>
                </iframe>
                </div>           
              </div>
            </div>
          </div>
        </div>
      @endforeach       
      </div>
    </div>
  </body>
</html> 