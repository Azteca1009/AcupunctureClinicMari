// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function() {

  ///////////////////////////
  // こんな症状にお悩みなら
  ///////////////////////////
  // hiddenの値を取得
  var faqId = $('input:hidden[name="hidden_faqId"]').val();
  var faq_q = $("#faq" + faqId + " .treatment_policy-faq-q");
  var childBtn = $("#faq" + faqId + " .treatment_policy-faq-q .treatment_policy-faq-q-btn");

  // ０よりも大きいIDが指定されていたら
  if (0 < faqId) {

    if (faq_q.hasClass("on")) {
      // onをなくして
      faq_q.removeClass('on');
      childBtn.attr('data-name', '＋');

    // onクラスがないなら
    } else {
      // onを追加して
      faq_q.addClass('on');
      childBtn.attr('data-name', '－');
    }

    // スライドさせる
    $("#faq" + faqId + " .treatment_policy-faq-q-a").slideToggle();
  }

  // メニューが押されたなら
  $(".treatment_policy-faq-q").click(function(){

    // 変数を格納
    var childBtn = $(this).children(".treatment_policy-faq-q-btn");
    // onクラスがあるなら
    if ($(this).hasClass("on")) {
      // onをなくして
      $(this).removeClass('on');
      childBtn.attr('data-name', '＋');

    // onクラスがないなら
    } else {
      // onを追加して
      $(this).addClass('on');
      childBtn.attr('data-name', '－');
    }

    // スライドダウン/アップ
    $(this).next(".treatment_policy-faq-q-a").slideToggle();
  });

  // 閉じるが押されたなら
  $(".treatment_policy-faq-q-a-closeBtn p").click(function(){

    var parentsFAQ = $(this).parents(".treatment_policy-faq-q-a");

    // onを追加して
    parentsFAQ.prev().removeClass('on');
    parentsFAQ.prev().children(".treatment_policy-faq-q-btn").attr('data-name', '＋');

    // スライドダウン/アップ
    parentsFAQ.slideUp();
  });

  ///////////////////////////
  // ライフスタイルに合わせた治療方針
  ///////////////////////////
  // メニューが押されたなら
  $(".treatment_policy-lifestyle-q").click(function(){

    // 変数を格納
    var childBtn = $(this).children(".treatment_policy-lifestyle-q-btn");
    // onクラスがあるなら
    if ($(this).hasClass("on")) {
      // onをなくして
      $(this).removeClass('on');
      childBtn.attr('data-name', '＋');

    // onクラスがないなら
    } else {
      // onを追加して
      $(this).addClass('on');
      childBtn.attr('data-name', '－');
    }

    // スライドダウン/アップ
    $(this).next(".treatment_policy-lifestyle-q-a").slideToggle();
  });

  // 閉じるが押されたなら
  $(".treatment_policy-lifestyle-q-a-closeBtn p").click(function(){

    var parentsFAQ = $(this).parents(".treatment_policy-lifestyle-q-a");

    // onを追加して
    parentsFAQ.prev().removeClass('on');
    parentsFAQ.prev().children(".treatment_policy-lifestyle-q-btn").attr('data-name', '＋');

    // スライドダウン/アップ
    parentsFAQ.slideUp();
  });

});
