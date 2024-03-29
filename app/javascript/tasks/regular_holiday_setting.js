// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function() {
  // trが押されたなら
  $("td").click(function() {
    // IDとCLASSを取得
    var getID = $(this).attr('id');
    var getCLASS = $(this).attr('class');

    var qqq = $("#session_" + getID).val();

    if(getCLASS == "open"){
      $(this).attr('class', 'close');
      $(this).text("ー");
      $("#session_" + getID).val("0");
    }else{
      $(this).attr('class', 'open');
      $(this).text("〇");
      if ( getID.match(/am_/)) {
        //strにam_を含む場合の処理
        $("#session_" + getID).val("1");
      }else{
        //strにam_を含まない場合の処理
        $("#session_" + getID).val("2");
      }
    }
  });
});
