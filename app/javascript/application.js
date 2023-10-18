// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import jquery from "jquery"
window.$ = jquery

$(function() {
  $('dt#question').click(function() {
    //クリックされた質問(question)の子要素(<div id="comment_area">と<div id="reply_area">)のspan以外からはopenというクラスを外す→開いていない状態にする
    $('dt#question').not(this).children('span').removeClass('open');
    //クリックされた質問()部分に対する回答(this=イベント発火元)以外(next=対象要素の次に配置されている要素)は全て閉じる(slideup=閉じる)
    $('dt#question').not(this).next().slideUp(400);
    
    //クリックされた質問(this)の子要素のspanにopenクラスが付与されいなければ付与し、付与されていれば外す(toggleclass=指定のクラスがあれば削除して、無ければつける)
    $(this).children('span').toggleClass('open');
    //クリックされた質問に対する回答を表示する(slidetoggle=開くand閉じる)
    $(this).next().slideToggle(400);
  });
});
