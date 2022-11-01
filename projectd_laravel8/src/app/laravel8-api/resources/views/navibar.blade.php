<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="/css/style.css">
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
  </head>
  <body>
    <div class="navigation">
      <ul>
        <li class="list">
          <a href="/top/{{ $user['id'] }}">
            <span class="icon"><ion-icon name="home-outline"></ion-icon></span>
            <span class="title">Top</span>
          </a>
        </li>
        <li class="list">
          <li class="nav-item dropdown">
            <a id="navbarDropdown" class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" v-pre>
              <span class="icon"><ion-icon name="bar-chart-outline"></ion-icon></span>
              <span class="title">Chart</span>
            </a>
          </li>
        </li>
        <li class="list">
          <li class="nav-item dropdown">
            <a id="navbarDropdown" class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" v-pre>
              <span class="icon"><ion-icon name="map-outline"></ion-icon></span>
              <span class="title">Map</span>
            </a>
          </li>
        </li>
        <li class="list">
          <a href="/information/{{ $user['id'] }}">
            <span class="icon"><ion-icon name="information-circle-outline"></ion-icon></span>
            <span class="title">Information</span>
          </a>
        </li>
        <li class="list">
          <a href="/setting/{{ $user['id'] }}">
            <span class="icon"><ion-icon name="bicycle-outline"></ion-icon></span>
            <span class="title">Setting</span>
          </a>
        </li>
        <li class="list">
          <a href="/help/{{ $user['id'] }}">
            <span class="icon"
              ><ion-icon name="help-circle-outline"></ion-icon
            ></span>
            <span class="title">Help</span>
          </a>
        </li>
      </ul>
    </div>
  </body>
</html>
