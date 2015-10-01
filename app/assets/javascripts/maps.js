window.onload = function(){
  // キャンパスの要素を取得する
  var canvas = document.getElementById('map-canvas');

  // 中心の位置座標を指定する
  var latlng = new google.maps.LatLng(35.4467036 , 139.5859097 );

  // 地図のオプションを設定する
  var mapOptions = {
    zoom: 11 ,          // ズーム値
    center: latlng ,    // 中心座標 [latlng]
  };

  // [canvas]に、[mapOptions]の内容の、地図のインスタンス([map])を作成する
  var map = new google.maps.Map( canvas , mapOptions ) ;


  // マーカー作成
  var infoWindows = [];

  infoWindows[0] = new google.maps.InfoWindow({
    content: "NPO法人地球学校" ,
    position: new google.maps.LatLng(35.3678827,139.5530918),
  });
  infoWindows[0].open( map ) ;


};
