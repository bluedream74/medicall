// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application";

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
eagerLoadControllersFrom("controllers", application);

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

// fadeアニメーション
jQuery(function ($) {
  $(function () {
    // fadein ロード
    load_effect();
    $(window).scroll(function () {
      scroll_effect();
    });
  });

  function load_effect() {
    // fadein ロード
    var tt = $(window).scrollTop();
    var hh = $(window).height();
    $(".u-load-fade").each(function () {
      var yy = $(this).offset().top;
      if (tt > yy - hh) {
        $(this).addClass("done");
      }
    });
    $(".u-load-fadeup").each(function () {
      var yy = $(this).offset().top;
      if (tt > yy - hh) {
        $(this).addClass("done");
      }
    });
  }

  //ふわっとスクロール
  function scroll_effect() {
    var tt = $(window).scrollTop();
    var hh = $(window).height();
    $(".u-scroll-fade").each(function () {
      var yy = $(this).offset().top + 150; //効果発生開始タイミングを操作したい場合は数値を変更する
      if (tt > yy - hh) {
        $(this).addClass("done");
      }
    });
    $(".u-scroll-up").each(function () {
      var yy = $(this).offset().top + 150; //効果発生開始タイミングを操作したい場合は数値を変更する
      if (tt > yy - hh) {
        $(this).addClass("done");
      }
    });
  }
});

// ヘッダーのカラー
window.addEventListener("scroll", function () {
  const headerItems = document.querySelectorAll(".c-header__item");
  if (window.pageYOffset > 30) {
    headerItems.forEach((item) => {
      item.classList.add("scrolled");
    });
  } else {
    headerItems.forEach((item) => {
      item.classList.remove("scrolled");
    });
  }
});

/** レスポンシブ対応 **/
!(function () {
  // 360px未満のデバイスのレスポンシブ対応
  var viewport = document.querySelector('meta[name="viewport"]');

  function switchViewport() {
    var value =
      window.outerWidth > 360
        ? "width=device-width,initial-scale=1.0"
        : "width=360";

    if (viewport.getAttribute("content") !== value) {
      viewport.setAttribute("content", value);
    }
  }

  addEventListener("resize", switchViewport, false);
  switchViewport();
})();

// fvアニメーション
document.addEventListener("DOMContentLoaded", function () {
  gsap.registerPlugin(ScrollTrigger);

  gsap.set(
    [
      ".p-mainview__symbol",
      ".p-mainview__title",
      ".p-mainview__description",
      ".p-mainview__cv",
      ".p-mainview__text",
    ],
    { opacity: 0, y: 50 }
  );

  var tl = gsap.timeline({ delay: 1 });

  tl.to(".p-mainview__symbol", {
    duration: 0.5,
    y: 0,
    opacity: 1,
    ease: "power2.out",
  })
    .to(
      ".p-mainview__title",
      { duration: 0.5, y: 0, opacity: 1, ease: "power2.out" },
      "-=0.3"
    )
    .to(
      ".p-mainview__description",
      { duration: 0.5, y: 0, opacity: 1, ease: "power2.out" },
      "-=0.3"
    )
    .to(
      ".p-mainview__cv",
      { duration: 0.5, y: 0, opacity: 1, ease: "power2.out" },
      "-=0.3"
    )
    .to(
      ".p-mainview__text",
      { duration: 0.5, y: 0, opacity: 1, ease: "power2.out" },
      "-=0.3"
    );
});
