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
//= require bootstrap
//= require redactor-rails
//= require redactor-rails/plugins
//= require_tree .

$(function( ) {
  $(".article_image img").on("load",function(){
    var iw, ih;
    var cw = 206; /*トリミング後の横幅*/
    var ch = 180; /*トリミング後の縦幅*/
    iw = ($(this).width() - cw) / 2;
    ih = ($(this).height() - ch) / 2;
    $(this).css("top", "-"+ih+"px");
    $(this).css("left", "-"+iw+"px");
  });

  $('.redactor').redactor(
    // { "imageUpload":"/redactor_assets/create?" + params,
    //   "imageGetJson":"/redactor_assets/",
    //   "buttonSource": true,
    //   "replaceDivs": false,
    //   "css":"style.css"}
  );
});

$().ready(function() {
  $('.truncate').jTruncSubstr({
    length: 200,            // 表示する文字数
    minTrail: 0,            // 省略文字の最低文字数
    moreText: "more",       // 省略部分を表示するリンクの文字
    lessText: "hide",       // 省略部分を非表示にするリンクの文字
    ellipsisText: "...",    // 省略部分をあらわす文字
    moreAni: "fast",        // 折り広げるスピード
    lessAni: "fast"         // 折り畳むスピード
  });
});
