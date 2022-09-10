var mymap = L.map('mymap').setView([35.368275, 139.415787], 16);

L.tileLayer(
        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: 'Map data © <a href="https://openstreetmap.org">OpenStreetMap</a> contributors',
        maxZoom: 18
}).addTo(mymap);

//現在地ピン設定
function onLocationFound(e) {
    L.marker(e.latlng).addTo(mymap).bindPopup("<b>現在地</b>").openPopup();
}

//現在地取得できない場合の処理
function onLocationError(e) {
    alert("現在地を取得できませんでした。" + e.message);
}

mymap.on('locationfound', onLocationFound);
mymap.on('locationerror', onLocationError);

mymap.locate({setView: true, maxZoom: 16, timeout: 20000});

//この下の部分をdbから引っ張るように修正
var data=null;

var request = new XMLHttpRequest();
 
    request.open('GET', 'http://127.0.0.1:8000/api/open_api', true);
    request.responseType = 'json';
 
    request.onload = function () {
        data = this.response;
            //アイコン設定
        //満車
        var icon1 = L.icon({
            iconUrl:'./img/full.jpg',
            iconSize: [50, 55],
            iconAnchor: [35, 30],
            popupAnchor: [0, -40]
        });
        //空車
        var icon2 = L.icon({
            iconUrl:'./img/empty.jpg',
            iconSize: [50, 55],
            iconAnchor: [35, 30],
            popupAnchor: [0, -40]
        });
        //緯度経度
        //var marker = L.marker([35.368275, 139.415787], {icon:icon1}).addTo(mymap);
        //marker.bindPopup("<b>文教大学駐輪場</b><br>"+"<b>駐車可能台数:</b>"+data[2].spots_max+"<br><b>最近の駐車台数</b><br>"+data[2].spots_average);


        for(let i=0; i<data.length; i++){
        const spot_id=data[i]["id"];
        const name=data[i].spots_name;
        const max=data[i].spots_max;
        const lat=data[i].spots_latitude;
        const long=data[i].spots_longitude;
        const count=data[i].spots_count;
        const ave=data[i].spots_average;

        if (count > max*0.9) 
        {
            var marker = L.marker([lat, long], {icon:icon1}).addTo(mymap);
            marker.bindPopup("<b>"+name+"</b><br><b>現在の駐車台数：</b>"+count+"<br><b>最大駐車台数：</b>"+max+"<br><b>平均駐車台数：</b>"+ave);
        }
        else
        {
            var marker = L.marker([lat, long], {icon:icon2}).addTo(mymap);
            marker.bindPopup("<b>"+name+"</b><br><b>現在の駐車台数：</b>"+count+"<br><b>最大駐車台数：</b>"+max+"<br><b>平均駐車台数：</b>"+ave);
        }
        
        }

      console.log(data);
    };
 
    request.send();


