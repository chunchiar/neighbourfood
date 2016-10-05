$(document).on("turbolinks:load",
function(){
  if($("#registration_map")){
    
    $("#user_address").on("blur", function(){
        console.log(this.value);
        $("#registration_map").html("<iframe id=\"map_frame\" "
                              + "width=\"450px\" height=\"300px\" frameborder=\"0\" scrolling=\"no\" "
                              + "src=\"https://www.google.com/maps/embed/v1/place?key=AIzaSyCQCk2YvCGWPw5Joa9nzpSOMrE42o3IF6g&q="
                              + this.value+"\"></iframe>");
    }

    )
  }
})
