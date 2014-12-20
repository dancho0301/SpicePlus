// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery
//= require bootstrap
//= require_tree .

$(document).ready(function() {

  function sendFile(file, editor,welEditable) {
    data = new FormData();
    data.append("article_image[image]", file);
    $.ajax({
      url: '/admin/article_images',
      data: data,
      cache: false,
      contentType: false,
      processData: false,
      type: 'POST',
      success: function(data){
        editor.insertImage(welEditable, data.url);
      }
    });
  }

  $('#summernote').summernote({
    height: 300, /*高さを指定*/
    lang: 'ja-JP', /*日本語対応*/

    onImageUpload: function(files, editor, welEditable) {
        sendFile(files[0], editor,welEditable);
    }
  });
});