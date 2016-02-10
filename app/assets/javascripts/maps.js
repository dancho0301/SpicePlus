window.onload = function(){

  // キャンパスの要素を取得する
  var canvas = document.getElementById('map-canvas');

  // 中心の位置座標を指定する
  var latlng = new google.maps.LatLng(35.4467036 , 139.5859097 );

  // 地図のオプションを設定する
  var mapOptions = {
    zoom: 11 ,          // ズーム値
    center: latlng ,    // 中心座標 [latlng]
    mapTypeControl: false
  };

  // [canvas]に、[mapOptions]の内容の、地図のインスタンス([map])を作成する
  var map = new google.maps.Map( canvas , mapOptions ) ;

  function attachMessage(marker, msg) {
    google.maps.event.addListener(marker, 'click', function(event) {
      new google.maps.InfoWindow({
        content: msg
      }).open(marker.getMap(), marker);
    });
  }

  // マーカー作成
  // var image = "/images/spice_icon_wai.png";
  for (i = 0; i < data.length; i++) {
    var image = "";
    switch (data[i].spice){
      case 1:
        image = "/images/spice_icon_wai.png";
        break;
      case 2:
        image = "/images/spice_icon_gatu.png";
        break;
      case 3:
        image = "/images/spice_icon_mat.png";
        break;
    }

    var myMarker = new google.maps.Marker({
      position: data[i].position,
      clickable: true,
      map: map,
      icon: image
    });
    attachMessage(myMarker, data[i].content);
  }

  // var marker = [];
  // var image = "/images/spice_icon_wai.png";
  // marker[0] = new google.maps.Marker({
  //   position: new google.maps.LatLng(35.400404, 139.534325),
  //   clickable: true,
  //   map: map,
  //   icon: image
  // });

  // var infoWindowOption = {
  //     position : position, //座標
  //     content : "ウィンドウ内に表示する文字列"
  // };
  // var infoWindow = new google.maps.InfoWindow(infoWindowOption);
  // infoWindow.open(map);
  //
  // var infoWindows = [];
  // infoWindows[0] = new google.maps.InfoWindow({
  //   content: "NPO法人地球学校" ,
  //   position: new google.maps.LatLng(35.3678827,139.5530918),
  // });
  // infoWindows[0].open(map);

};
