$(function() {
  var kininaru_click_flg = true;
  var ouensuru_click_flg = true;
  var ufufu_click_flg = true;

  $('.btn-reputation').click(function() {
    var click_flg = true;
    var _article_id = $('.article_reputation').attr("article_id");
    var _genre = $(this).attr('genre');

    switch (_genre){
      case '0':
        click_flg = kininaru_click_flg;
        kininaru_click_flg = false;
        break;
      case '1':
        click_flg = ouensuru_click_flg;
        ouensuru_click_flg = false;
        break;
      case '2':
        click_flg = ufufu_click_flg;
        ufufu_click_flg = false;
        break;
    }
    if(click_flg){
      txt_count = $(this).prev();
      $.getJSON("/articles/like/" + _article_id + "/" + _genre + "",function(data){
        txt_count.text(data.count);
      });
    }

  }).css('cursor', 'pointer');

  // $('.btn-reputation').on('click touchend', function(){
  //   console.log('click2!');
  // });
});
