<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>WTF Google Map</title>
<script type="text/javascript"
   src="http://maps.google.com/maps/api/js?sensor=true"></script>
<link href="css/bootstrap.css" rel="stylesheet" />
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script>
   // 마크, 동선을 그리고 난 후 해당 위치를 array에 저장합니다.
   var MarkersArray = [];
   var Coordinates = [];
   var travelPathArray = [];

   var map;
   var myLatlng = new google.maps.LatLng(37.570450131147325,
         126.99193239212036);

   function WriteControl(controlDiv, map) {
      controlDiv.style.padding = '5px';

      // Set CSS for the control border
      var controlUI = document.createElement('div');
      controlUI.style.backgroundColor = 'white';
      controlUI.style.borderStyle = 'solid';
      controlUI.style.borderWidth = '2px';
      controlUI.style.cursor = 'pointer';
      controlUI.style.textAlign = 'center';
      controlUI.title = '사진을 올려보자';
      controlDiv.appendChild(controlUI);

      // Set CSS for the control interior
      var controlText = document.createElement('div');
      controlText.style.fontFamily = 'Arial,sans-serif';
      controlText.style.fontSize = '20px';
      controlText.style.paddingLeft = '4px';
      controlText.style.paddingRight = '4px';
      controlText.innerHTML = '<b>글을 쓰자ㅏㅏㅏㅏㅏㅏ</b>';
      controlUI.appendChild(controlText);

      google.maps.event.addDomListener(controlUI, 'click', function() {
         google.maps.event.addListener(map, 'click', function(event) {
            
            
            //window.showModalDialog("write.html", "hello...", "dialogWidth:300px; dialogHeight:200px");
            $('#writhe-modal').modal();

            
             //var image = 'image/aaaaa.png'; // 마커 이미지 바꾸기
            var size_x = 40;
            var size_y = 40;
            var image = new google.maps.MarkerImage(
                  'image/i0692502338.jpg', new google.maps.Size(size_x,
                        size_y), '', '', new google.maps.Size(size_x,
                        size_y));
            var marker = new google.maps.Marker({
               position : event.latLng,
               map : map,
               icon : image, // 마커 이미지 
               title : '위치마커'
            });
            attachMessage(marker, event.latLng);
            //선을 그리기 위해 좌표를 넣는다.
            Coordinates.push(event.latLng);
            //마커 담기
            MarkersArray.push(marker);
            //array에 담은 위도,경도 데이타를 가지고 동선 그리기
            //flightPath();
            
            
            
            /* <button type="button" class="wr-btn" data-toggle="modal" data-target="#writhe-modal">글쓰기</button> */

         });
         
      });
   }

   function SearchControl(controlDiv, map) {
      controlDiv.style.padding = '5px';

      // Set CSS for the control border
      var controlUI = document.createElement('div');
      controlUI.style.backgroundColor = 'white';
      controlUI.style.borderStyle = 'solid';
      controlUI.style.borderWidth = '2px';
      controlUI.style.cursor = 'pointer';
      controlUI.style.textAlign = 'center';
      controlUI.title = '검색을 해보자';
      controlDiv.appendChild(controlUI);

      // Set CSS for the control interior
      var controlText = document.createElement('div');
      controlText.style.fontFamily = 'Arial,sans-serif';
      controlText.style.fontSize = '20px';
      controlText.style.paddingLeft = '4px';
      controlText.style.paddingRight = '4px';
      
      controlText.innerHTML = "<input type='textbox' id='address' placeholder='검색할 주소를 입력하십시오.' />"
            + "<input type='button' value='검색' onClick='codeAddress()' />";
      controlUI.appendChild(controlText);

   }

   function initialize() {
      geocoder = new google.maps.Geocoder();
      var myOptions = {
         zoom : 8,
         center : myLatlng,
         scrollwheel : true,
         zoomControl : false,
         panControl : false,
         mapTypeControl : false,
         scaleControl : false,
         streetViewControl : false,
         mapTypeId : google.maps.MapTypeId.ROADMAP
      }
      
      map = new google.maps.Map(document.getElementById("map_canvas"),
            myOptions);
      

      var writeControlDiv = document.createElement('div');
      var writeControl = new WriteControl(writeControlDiv, map);

      writeControlDiv.index = 1;
      map.controls[google.maps.ControlPosition.RIGHT_BOTTOM]
            .push(writeControlDiv);

      var searchControlDiv = document.createElement('div');
      var searchControl = new SearchControl(searchControlDiv, map);

      searchControlDiv.index = 1;
      map.controls[google.maps.ControlPosition.TOP_RIGHT]
            .push(searchControlDiv);
   }

   //해당 위치에 주소를 가져오고, 마크를 클릭시 infowindow에 주소를 표시한다.
   function attachMessage(marker, latlng) {
      geocoder = new google.maps.Geocoder();
      geocoder.geocode({
         'latLng' : latlng
      }, function(results, status) {
         if (status == google.maps.GeocoderStatus.OK) {
            if (results[0]) {
               var address_nm = results[0].formatted_address;
               $(".addr").text(address_nm);
               //alert(address_nm);
                var infowindow = new google.maps.InfoWindow({
                  content : address_nm,
                  size : new google.maps.Size(50, 50)
               });
               
               google.maps.event.addListener(marker, 'click', function() {
                  infowindow.open(map, marker);
               });
            }
         } else {
            alert('주소 가져오기 오류!');
         }
      });
   }

   /*
   //동선그리기
   function flightPath() {
      for (i in travelPathArray) {
         travelPathArray[i].setMap(null);
      }
      var flightPath = new google.maps.Polyline({
         path : Coordinates,
         strokeColor : "#FF0000",
         strokeOpacity : 0.3,
         strokeWeight : 2
      });
      flightPath.setMap(map);
      travelPathArray.push(flightPath);
   }*/
   
   function codeAddress() {
       var address = document.getElementById("address").value;
       if(address=='검색할 주소를 입력하십시오.' || address==''){
           alert('검색할 주소를 입력하십시오.');
           document.getElementById("address").value='';
           document.getElementById("address").focus();
           return;
       }

       geocoder.geocode( { 'address': address}, function(results, status) {
          if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
   }
   
   google.maps.event.addDomListener(window, 'load', initialize);
   </script>
</head>
<body onload="initialize()">
<div id="map_canvas" style="width: 100%; height: 100%;"></div>
   <div class="modal fade" tabindex="-1" role="dialog" id="writhe-modal" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
               <h4 class="modal-title" id="myModalLabel">글쓰기</h4>
            </div>
            <div class="modal-body">
               <form id="upload" name="upload" class="f2" method="post" enctype="multipart/form-data">
                  <p id="imagePreview" class="img"></p>
                  <input type="text" placeholder="제목" class="text" name="sub" id="sub" /><br />
                  <input id="imageInput" type="file" name="myPhoto" onchange="loadImageFile();" /><br />
               </form>
               <p class='addr'></p>
               <textarea rows="6" cols="60" placeholder="사진 내용" class="text"></textarea>
               <br />
               <form id="f1" class="f1">
                  <button type="submit" class="nobtn">Send</button>
                  <button type="reset">Reset</button>
               </form>
            </div>
         </div>
      </div>
   </div>
</body>
</html>