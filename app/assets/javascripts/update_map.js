function updateMap(target, input_target){
  var data = input_target.val();
  var html = '<iframe id="map_frame" width="100%" height="350px" frameborder="0" scrolling="no" src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCQCk2YvCGWPw5Joa9nzpSOMrE42o3IF6g&q='+data+'"></iframe>'
  $(target).html(html);
}

function loadMap(target, input_target){
  var data = input_target;
  var html = '<iframe id="map_frame" width="100%" height="350px" frameborder="0" scrolling="no" src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCQCk2YvCGWPw5Joa9nzpSOMrE42o3IF6g&q='+data+'"></iframe>'
  $(target).html(html);
}
