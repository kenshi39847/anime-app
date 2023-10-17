// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import jquery from "jquery"
window.$ = jquery

$(function() {
  $('.question').click(function() {
    //クリックされた質問の子要素のspan以外からはopenというクラスを外す
    $('.question').not(this).children('span').removeClass('open');
    //クリックされた質問部分に対する回答以外は全て閉じる
    $('.question').not(this).next().slideUp(400);
    
    //クリックされた質問の子要素のspanにopenクラスが付与されいなければ付与し、付与されていれば外す
    $(this).children('span').toggleClass('open');
    //クリックされた質問に対する回答を表示する
    $(this).next().slideToggle(400);
  });
});