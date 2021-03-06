        ��  ��                  e-  4   ��
 R E S _ M A P C O D E       0 
        <!-- saved from url=(0014)about:internet -->
<!DOCTYPE html> 
<html> 
<head> 
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta charset="utf-8"> 
<meta name="viewport" content="initial-scale=1.0, user-scalable=no"> 
<style type="text/css"> 
  html { height: 100% } 
  body { height: 100%; margin: 0px; padding: 0px } 
  #map_canvas { height: 100% } 
</style> 

<script type="text/javascript" src="https://cdn.rawgit.com/cadetill/gmlib_v2/master/resources/conversion.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/cadetill/gmlib_v2/master/resources/map.js"></script>

<script language=javascript>
  document.onkeydown = function(){
    if (window.event && window.event.keyCode == 116) { 
      /* Capture and remap F5 */
      window.event.keyCode = 505;
    }
    if(window.event && window.event.keyCode == 505) { 
      /* New action for F5 */
      return false;
      /* Must return false or the browser will refresh anyway */
    }
  }
  document.documentElement.style.overflowY = 'hidden';
</script>

<script>

  /******************************************************************************
     Global variables 
  *******************************************************************************/
  var map = null; 

  /******************************************************************************
     temporal function
  *******************************************************************************/

  function MapChangeProperty(PropName, Value) {
	switch (PropName.toLowerCase()) {
      case 'maptypeid': Value = StrToMapType(Value); map.setOptions({options: {mapTypeId: Value}}); break;
      case 'zoom': map.setOptions({options: {zoom: Value}}); break;
	}
  }
  
  function MapChangeCenter(Lat,Lng,NoWrap) {
    map.setCenter({lat: Lat, lng: Lng, noWrap: NoWrap}); 
  }
  
  /******************************************************************************
     Map create
  *******************************************************************************/
  function DoMap(/* center */ Lat,Lng,NoWrap,
                 disableDefaultUI,disableDoubleClickZoom,draggable,draggableCursor,draggingCursor,fullscreenControl,
                 /*fullscreenControlOptions*/fullscreenControlPosition,
                 heading,keyboardShortcuts,mapMaker,mapTypeControl,
                 /*mapTypeControlOptions*/mapTypeIds,mapTypePosition,mapTypeStyle,
                 mapTypeId,maxZoom,minZoom,noClear,overviewMapControl,
                 /*overviewMapControlOptions*/overviewMapControlOpened,
                 panControl,
                 /*panControlOptions*/panControlPosition,
                 rotateControl,
                 /*rotateControlOptions*/rotateControlPosition,
                 scaleControl,
                 /*scaleControlOptions*/scaleControlStyle,
                 scrollwheel,
                 /*streetView*/panAddressControl,
                               /*addressControlOptions*/panAddressControlPosition,
                               panClickToGo,panDisableDefaultUI,panDisableDoubleClickZoom,panEnableCloseButton,panFullscreenControl,
                               /*fullscreenControlOptions*/panFullscreenControlPosition,
                               panImageDateControl,panLinksControl,panPanControl,
                               /*panControlOptions*/panPanPosition,
                               /*pov*/panPovHeading,panPovPitch,
                               panScrollwheel,panVisible,panZoomControl,
                               /*zoomControlOptions*/panZoomPosition,panZoomStyle,
                 streetViewControl,
                 /*streetViewControlOptions*/streetViewPosition,
                 tilt,zoom,zoomControl,
                 /*zoomControlOptions*/zoomControlPosition,zoomControlStyle,
                 backgroundColor,styles
                ) {
alert('0');    
    /*if (disableDefaultUI) {
      fullscreenControl = false;
      mapTypeControl = false;
      overviewMapControl = false;
      panControl = false;
      rotateControl = false;
      scaleControl = false;
      streetViewControl = false;
      zoomControl = false;
    }
    mapTypeIds = mapTypeIds.split(";"); 
    for (i = 0; i < mapTypeIds.length; i++){ mapTypeIds[i] = StrToMapType(mapTypeIds[i]) }; 
    fullscreenControlPosition = StrToPosition(fullscreenControlPosition); 
    mapTypePosition = StrToPosition(mapTypePosition); 
    mapTypeStyle = StrToMapTypeControlStyle(mapTypeStyle); 
    */mapTypeId = StrToMapType(mapTypeId);
    /*if (maxZoom = 0) maxZoom = null; 
    if (minZoom = 0) minZoom = null; 
    panControlPosition = StrToPosition(panControlPosition);  
    rotateControlPosition = StrToPosition(rotateControlPosition);  
    scaleControlStyle = StrToScaleControlStyle(scaleControlStyle); 
    streetViewPosition = StrToPosition(streetViewPosition);  
    panPanPosition = StrToPosition(panPanPosition);  
    zoomControlPosition = StrToPosition(zoomControlPosition);  
    zoomControlStyle = StrToZoomControlStyle(zoomControlStyle); 
    styles = StrToStyles(styles);
    */map = new google.maps.Map(document.getElementById('map_canvas'), {
                              //backgroundColor: backgroundColor,	
                              center: {lat: Lat, lng: Lng, noWrap: NoWrap},
                              /*disableDefaultUI: disableDefaultUI,
                              disableDoubleClickZoom: disableDoubleClickZoom,
                              draggable: draggable,
                              draggableCursor: draggableCursor,
                              draggingCursor: draggingCursor,
							  fullscreenControl: fullscreenControl,
							  fullscreenControlOptions: {position: fullscreenControlPosition},
                              heading: heading,
                              keyboardShortcuts: keyboardShortcuts,
                              mapMaker: mapMaker,
                              mapTypeControl: mapTypeControl,
                              mapTypeControlOptions: {mapTypeIds: mapTypeIds, position: mapTypePosition, style: mapTypeStyle},
                              */mapTypeId: mapTypeId,
                              /*maxZoom: maxZoom,
                              minZoom: minZoom,
                              noClear: noClear,
                              overviewMapControl: overviewMapControl,
                              overviewMapControlOptions: {opened: overviewMapControlOpened},
                              panControl: panControl,
                              panControlOptions: {position: panControlPosition},
                              rotateControl: rotateControl,
                              rotateControlOptions: {position: rotateControlPosition},
                              scaleControl: scaleControl,
                              scaleControlOptions: {style: scaleControlStyle},
                              scrollwheel: scrollwheel,
                              streetView: new google.maps.StreetViewPanorama(document.getElementById('map'),
                                          {addressControl: panAddressControl, 
                                           addressControlOptions: {position: panAddressControlPosition},
                                           clickToGo: panClickToGo,
                                           disableDefaultUI: panDisableDefaultUI,
                                           disableDoubleClickZoom: panDisableDoubleClickZoom,
                                           enableCloseButton: panEnableCloseButton,
                                           fullscreenControl: panFullscreenControl,
                                           fullscreenControlOptions: {position: panFullscreenControlPosition},
                                           imageDateControl: panImageDateControl,
                                           linksControl: panLinksControl,
                                           panControl: panPanControl,
                                           panControlOptions: {position: panPanPosition},
                                           position: {lat: Lat, lng: Lng, noWrap: NoWrap},
                                           pov: {heading: panPovHeading, pitch: panPovPitch},
                                           scrollwheel: panScrollwheel,
                                           visible: panVisible,
                                           zoomControl: panZoomControl,
                                           zoomControlOptions: {position: panZoomPosition, style: panZoomStyle}
                                          }),
                              streetViewControl: streetViewControl,
                              streetViewControlOptions: {position: streetViewPosition},
                              tilt: tilt,
                              */zoom: zoom,
                              /*zoomControl: zoomControl,
                              zoomControlOptions: {position: zoomControlPosition, style: zoomControlStyle}
                              */});
    
    map.mapTypes.set("OSM", new google.maps.ImageMapType({
                getTileUrl: function(coord, zoom) {
                    return "http://tile.openstreetmap.org/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
                },
                tileSize: new google.maps.Size(256, 256),
                name: "OpenStreetMap",
                maxZoom: 18
            }));
  }
  
</script> 

</head> 

<body>
  <table border=1 align=center>
    <tr>                                      
      <td align=center width=70 onClick="DoMap(
                        0,0,false,
                        false,true,true,'','',true,
                        'cpRIGHT_TOP',
                        0,true,false,true,
                        'mtHYBRID;mtROADMAP;mtSATELLITE;mtTERRAIN;mtOSM','cpTOP_RIGHT','mtcDEFAULT',
                        'mtROADMAP',0,0,false,true,
                        false,
                        true,
                        'cpTOP_LEFT',
                        true,
                        'cpTOP_LEFT',
                        true,
                        'scDEFAULT',
                        true,
                        true,
                            'cpTOP_LEFT',
                            true,false,false,true,true,
                            'cpRIGHT_TOP',
                            false,false,true,
                            'cpTOP_LEFT',
                            0,0,
                            true,false,true,
                            'cpTOP_LEFT','zcDEFAULT',
                        true,
                        'cpTOP_LEFT',
                        0,8,true,
                        'cpTOP_LEFT','zcDEFAULT',
                        '#000000','setALL,sftALL&1,true,0,0,vOn,0,#000000,#000000&1,true,0,0,vOn,0,#000000,#000000¬setALL,sftALL&1,true,0,0,vOn,0,#000000,#000000&1,true,0,0,vOn,0,#000000,#000000&1,true,0,0,vOn,0,#000000,#000000'
                                                )"
	  >
        Map
      </td>
    </tr>
  </table>

  <div id="map_canvas" style="width:100%; height:100%"></div> 

<!--
  <script async defer src="https://maps.googleapis.com/maps/api/js?v=API_VER&key=API_KEY&signed_in=API_SIGNED&language=API_LAN"></script>
-->
  <script async defer src="https://maps.googleapis.com/maps/api/js?v=3.23&key=&signed_in=false&language="></script>
</body> 
</html>
   