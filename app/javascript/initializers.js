document.addEventListener("turbo:load", function() {
  $(function() {
    // ヘッダー項目をマウスオーバーしたときの処理
    $(".mod-gnav-links-item").hover(
      function() {

        // すでにonクラスが存在しているなら
        if($(".mod-megaNav-cats-item").hasClass("on")){
          // そのクラスは削除する
          $(".mod-megaNav-cats-item").removeClass('on');
        }
        // 選択された要素のメニューを表示させる
        var index = $(".mod-gnav-links-item").index(this);
        $(".mod-megaNav-cats-item").eq(index).addClass('on');
      },
      function() {
      }
    );
    // ヘッダーをマウスオーバーしたときの処理
    $("header").hover(
      function() {
      },
      function() {
        // headerからカーソルが外れればメニューは必要ないため削除する
        $(".mod-megaNav-cats-item").removeClass('on');
      }
    );

    // 画面上部へスクロール
    $(".mod-footer-pagetop").click(function() {
      $('html,body').animate({
          scrollTop: 0
      }, 800);//この場所に数値を入れるとミリ秒単位で移動のスピードを調整できます
      return false;
    });

    // スマホ用対応
    $(".mod-header-contactLinks-item.item-gnavBtn").click(function(){
      // すでにonクラスが存在しているなら
      if($(".mod-gnav").hasClass("on")){
        // onを削除
        $(".mod-gnav").removeClass('on');
      }else{
        $(".mod-gnav").addClass('on');
      }
    });

    // クローズボタンが押されたなら
    $(".mod-gnav-close").click(function(){
      // onを削除
      $(".mod-gnav").removeClass('on');
    });

    // メニュー一覧の＋が押されたなら
    $(".mod-gnav-foldingBtn-btn").click(function(){
      // onクラスがあるなら
      if ($(this).hasClass("on")) {
        // onをなくして
        $(this).removeClass('on');
        $(this).attr('data-name', '＋');
      // onクラスがないなら
      } else {
        // onを追加して
        $(this).addClass('on');
        $(this).attr('data-name', '－');
      }
      // スライドアップ
      $(this).parent().next("ul").slideToggle();

    });
  });
});
