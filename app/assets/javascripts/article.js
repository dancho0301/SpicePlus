$(function() {
  $('.btn-reputation').click(function() {
    txt_count = $(this).prev();
    _article_id = $('.article_reputation').attr("article_id");
    _genre = $(this).attr('genre');
    $.getJSON("/articles/like/" + _article_id + "/" + _genre + "",function(data){
      txt_count.text(data.count);
    });
  });
});
