// GeoLocation을 이용해서 접속 위치를 얻어옵니다
   
   navigator.geolocation.getCurrentPosition(function(position) {
    
    var lat = position.coords.latitude, // 위도
        lon = position.coords.longitude; // 경도

    
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); 

    // 지도 타입 변경 컨트롤을 생성한다
   var mapTypeControl = new kakao.maps.MapTypeControl();

   // 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
   map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
    
//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

var json_url = "/json/test.json";

// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
   $.getJSON(json_url, function (data, textStatus) {

        var NAME = null;
        var LAT = null;
        var LNG = null;
        
        $.each(data.kinderInfo, function () {
            NAME = this.NAME;
            LAT = this.LAT;
            LNG = this.LNG;
            ADDR = this.ADDR;

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: new kakao.maps.LatLng(LNG, LAT), // 마커를 표시할 위치
                clickable: true
            });
            
            
         // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
            var iwContent = 
                ' <div class="">' + 
                '    <div class="">' + 
                '        <div class="title">' + 
                         NAME  + 
                '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
                '        </div>' + 
                '        <div class="body">' + 
                '            <div class="desc">' + 
                '                <div class="ellipsis">'
                               + ADDR +
                '             </div>' + 
                '                <div><a href="#" target="_blank" class="link">더보기</a></div>' + 
                '            </div>' + 
                '        </div>' + 
                '    </div>' +    
                '</div>',
                iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                content : iwContent,
                removable : iwRemoveable
            });

            // 마커에 클릭이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'click', function() {
                  // 마커 위에 인포윈도우를 표시합니다
                  infowindow.open(map, marker);  
            });
            console.log(NAME + " : " + LAT + " , " + LNG + "," + ADDR);
         
        });
 
   });
});