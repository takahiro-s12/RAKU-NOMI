// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
/* global $*/
/* global jQuery*/

/*TOPページのスクロールアクション*/
$(function(){
  $(window).on('load scroll',function(){
    $('.animation').each(function(){
      var target = $(this).offset().top;
      var scroll = $(window).scrollTop();
      var height = $(window).height();
      if (scroll > target - height){
        $(this).addClass('active');
      }
    });
  });
});

/*プレビュー機能*/
$(function(){
  $(document).on('turbolinks:load',function(){
    function readURL(input) {
      if (input.files && input.files[0]){
        var reader = new FileReader();
        reader.onload = function (e){
          $('#edit-profile-image').attr('src',e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
      }
    }
    $('.img-field').change(function(){
      readURL(this);
    });
  });
});

/*ハンバーガーメニュー*/
$(function() {
  $(document).on('turbolinks:load',function(){
    $('.menu-trigger').on('click', function(event){
      $(this).toggleClass('active');
      $('#sp-menu').fadeToggle();
      event.preventDefault();
    });
  });
});

/*泡のアニメーション*/

jQuery(document).ready(function($){
  var bArray = [];
  // 泡のサイズの配列
  var sArray = [6,8,10,12];
  // 泡が出る幅の範囲計算
  for (var i = 0; i < $('.top-main-body').width(); i++){
    bArray.push(i);
  }
  // 配列からランダムに値を出す
  function randomValue(arr) {
    return arr[Math.floor(Math.random() * arr.length)];
  }
  setInterval(function(){
    // 泡のサイズをランダムに選定
    var size = randomValue(sArray);
    // body内のランダムな場所に泡を配置
    $('.top-main-body').append(
      '<div class="bubble" style="left: ' + randomValue(bArray) + 'px; width: ' + size + 'px; height:' + size + 'px;"></div>'
    );
    // 5秒かけて泡が上に上がる
    $('.bubble').animate({
      'bottom': '100%',
      'opacity' : '-=0.7'
    }, 5000, function(){
      $(this).remove();
    });
    // 0.35秒毎に泡を出す
  }, 50);
});