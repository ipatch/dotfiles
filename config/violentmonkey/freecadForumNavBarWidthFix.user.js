// ==UserScript==
// @name        freecadweb.org navbar width
// @namespace   Violentmonkey Scripts
// @match       https://forum.freecadweb.org/*
// @grant       none
// @run-at      document-start
// @version     1.0
// @author      github.com/ipatch
// @description fix navbar overflow
// @downloadURL https://raw.githubusercontent.com/ipatch/dotfiles/release/config/violentmonkey/freecadForumNavBarWidthFix.user.js 
// @supportURL  https://github.com/ipatch/dotfiles/issues
// @homepageURL https://github.com/ipatch/dotfiles
// ==/UserScript==

console.log('violentmoneky, navbar width');
  
var styleSheet = "" +
  "@media (min-width: 768px) and (max-width: 991px) {" +
    ".container {" +
      // uncomment the below css property to visually see when script is used
      // "background-color: blue;" +
      "width: 100%;" +
    "}" +
  "}" +
"";

(function () {
  var s = document.createElement('style');
  s.type = "text/css";
  s.innerHTML = styleSheet;
  (document.head || document.documentElement).appendChild(s);
})();

