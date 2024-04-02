<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=724fae357dc77c6df9a18c9fc030d033"></script>
</head>
<body>

	<form action="UpdateSchoolInfo.do" method="POST"
		enctype="multipart/form-data">
		<div id="map" style="width: 1000px; height: 800px;"></div>
		<select id="schoolType">
			<option value="">학교 유형을 선택하세요</option>
			<option value="middle">중학교</option>
			<option value="high">고등학교</option>

		</select> <select id="schoolList" type="text" name="user_sc_nm"
			class="form-control">
			<option value="">먼저 학교 유형을 선택하세요</option>
		</select> <br>
		

		학생증 업로드<input type="file" name="user_sc_img" class="form-control">
		<button type="submit">등록</button>
		<script>
			document.getElementById("schoolType").addEventListener(
					"change",
					function(e) {
						let arrType = getSchoolList().obj;

						let schoolList = document.getElementById("schoolList");
						schoolList.innerHTML = '';
						schoolList.appendChild(new Option("학교를 선택하세요", ""));

						if (e.target.value === "middle") {
							arrType.middle.forEach(function(school) {
								schoolList.appendChild(new Option(school.name,
										school.value));
							});
						} else if (e.target.value === "high") {
							arrType.high.forEach(function(school) {
								schoolList.appendChild(new Option(school.name,
										school.value));
							});

						}
					});

			function getSchoolList() {
				var obj = {
					middle : [ {
						name : '조선대학교부속중학교',
						value : '조선대학교부속중학교'
					}, {
						name : '살레시오여자중학교',
						value : '살레시오여자중학교'
					}, {
						name : '조선대학교여자중학교',
						value : '조선대학교여자중학교'
					} ],
					high : [ {
						name : '전남여자고등학교',
						value : '전남여자고등학교'
					}, {
						name : '살레시오여자고등학교',
						value : '살레시오여자고등학교'
					}, {
						name : '조선대학교여자고등학교',
						value : '조선대학교여자고등학교'
					} ]
				}
				return {
					obj : obj
				};
			}
			
			latitude = 33.450701
			longitude = 126.570667
			
			//지도 생성
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center : new kakao.maps.LatLng(latitude, longitude), //지도의 중심좌표.
				level : 5
			//지도의 레벨(확대, 축소 정도)
			}
			
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			
			
			// 지도 업데이트
			document.getElementById("schoolType").addEventListener("change", function(e) {
				if(e.target.value === "middle") {
	                  // 중학교 위치로 업데이트
						// setCenter(35.145303,126.929504)
						setCenter(35.149789, 126.919961);
	            // 노란색 마커를 표시할 위치와 title 객체 배열입니다 
	            var positions = [
	                {
	                    title: '조선대학교부속중학교', 
	                    latlng: new kakao.maps.LatLng(35.143772, 126.927952)
	                },
	                {
	                    title: '조선대학교여자중학교', 
	                    latlng: new kakao.maps.LatLng(35.145134, 126.931544)
	                },
	                {
	                    title: '살레시오여자중학교', 
	                    latlng: new kakao.maps.LatLng(35.146319, 126.929679)
	                }
	            ];

	             // 마커 이미지의 이미지 주소입니다
	                var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	                    
	                for (var i = 0; i < positions.length; i ++) {
	                    
	                    // 마커 이미지의 이미지 크기 입니다
	                    var imageSize = new kakao.maps.Size(24, 35); 
	                    
	                    // 마커 이미지를 생성합니다    
	                    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	                    
	                    // 마커를 생성합니다
	                    var marker = new kakao.maps.Marker({
	                        map: map, // 마커를 표시할 지도
	                        position: positions[i].latlng, // 마커를 표시할 위치
	                        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	                        image : markerImage // 마커 이미지 
	                    });
	                }
	                
	                // 파란색 마커
	             // 마커가 표시될 위치입니다 
	                var markerPosition  = new kakao.maps.LatLng(35.149789, 126.919961 ); 

	                // 마커를 생성합니다
	                var marker = new kakao.maps.Marker({
	                    position: markerPosition
	                });

	                // 마커가 지도 위에 표시되도록 설정합니다
	                marker.setMap(map);
	
	            } else if(e.target.value === "high") {
	            	
	            
	            	
	                //setCenter(35.149838, 126.92582); 
	                setCenter(35.149789, 126.919961); // 고등학교 위치로 업데이트
	            
	             // 마커를 표시할 위치와 title 객체 배열입니다 
		            var positions = [
		                {
		                    title: '살레시오여자고등학교', 
		                    latlng: new kakao.maps.LatLng(35.146943, 126.929784)
		                },
		                {
		                    title: '조선대학교여자고등학교', 
		                    latlng: new kakao.maps.LatLng(35.146454, 126.932433)
		                },
		                {
		                    title: '전남여자고등학교', 
		                    latlng: new kakao.maps.LatLng(35.151362, 126.920602)
		                }
		            ];
	                
		         // 마커 이미지의 이미지 주소입니다
		            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		                
		            for (var i = 0; i < positions.length; i ++) {
		                
		                // 마커 이미지의 이미지 크기 입니다
		                var imageSize = new kakao.maps.Size(24, 35); 
		                
		                // 마커 이미지를 생성합니다    
		                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		                
		                // 마커를 생성합니다
		                var marker = new kakao.maps.Marker({
		                    map: map, // 마커를 표시할 지도
		                    position: positions[i].latlng, // 마커를 표시할 위치
		                    title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		                    image : markerImage // 마커 이미지 
		                });
		            }
		            
		            // 파란색 마커
		             // 마커가 표시될 위치입니다 
		                var markerPosition  = new kakao.maps.LatLng(35.149789, 126.919961); 

		                // 마커를 생성합니다
		                var marker = new kakao.maps.Marker({
		                    position: markerPosition
		                });

		                // 마커가 지도 위에 표시되도록 설정합니다
		                marker.setMap(map);
	                
	            }
				
				
			});
			
			
			function setCenter(lat,lang) {            
			    // 이동할 위도 경도 위치를 생성합니다 
			    var moveLatLon = new kakao.maps.LatLng(lat, lang);
			    
			    // 지도 중심을 이동 시킵니다
			    map.setCenter(moveLatLon);
			}
			
			function DeleteMarkers(){
			    for (var i = 0; i < markers.length; i++) {
			        markers[i].setMap(null);
			    }            
			}
		
		
	
				
		</script>


	</form>
</body>
</html>