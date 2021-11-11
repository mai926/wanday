"use stript";

$(function () {
  // ハンバーガーメニュークリックイベント
  $(".header-user-icon").click(function () {
    if ($(".nav-sp").hasClass("open")) {
      // ナビゲーション非表示
      $(".nav-sp").removeClass("open");
      // ハンバーガーメニューを元に戻す
      $(this).removeClass("open");
    } else {
      // ナビゲーションを表示
      $(".nav-sp").addClass("open");
    }
  });
});
