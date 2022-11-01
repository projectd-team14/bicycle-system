<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
  </head>
  <body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-name card-header">Setting</div>
                    <form method='POST' action="/spot-store">
                    @csrf
                    <input type='hidden' name='user_id' value="{{ $user['id'] }}">
                    <div class="form-group">
                        <div class="col-md-10 m-2 ms-5">
                            <label for="name">Spot Name</label>
                            <input name='name' type="text" class="form-control" id="name" placeholder="Please enter Name">  
                        </div>
                        <div class="col-md-10 m-2 ms-5">
                            <label for="name">Address</label>
                            <input name='address' type="text" class="form-control" id="address" placeholder="Please enter Address">  
                        </div>
                        <div class="col-md-10 m-2 ms-5">
                            <label for="name">Explanation</label>
                            <input name='explanation' type="text" class="form-control" id="explanation" placeholder="Please enter Explanation">  
                        </div>
                        <div class="col-md-10 m-2 ms-5">
                            <label for="name">Spot URL</label>
                            <input name='url' type="text" class="form-control" id="url" placeholder="YouTubeURL">  
                        </div>  
                    </div>
                    <div class="col-md-2 mt-4 m-2 ms-5">
                        <button type='submit' class="btn btn-primary btn-lg">Register</button>                       
                    </div>
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>