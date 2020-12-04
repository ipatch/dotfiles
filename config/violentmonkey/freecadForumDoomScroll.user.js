// ==UserScript==
// @name        freecadweb.org doom scroll 
// @namespace   Violentmonkey Scripts
// @match       https://forum.freecadweb.org/*
// @grant       none
// @run-at      document-start
// @version     1.0.9
// @author      github.com/ipatch
// @description to infiniti and beyond
// @downloadURL http://localhost/~capin/freecadForumDoomScroll.user.js
// @updateURL   http://localhost/~capin/freecadForumDoomScroll.user.js
// @supportURL  https://github.com/ipatch/dotfiles/issues
// @homepageURL https://github.com/ipatch/dotfiles
// ==/UserScript==

// NOTE: version number may need to bumped on intial load for script to read updates
console.log('violentmonkey, doom scroll hello!');

console.log('w00t');

const actionBar = document.querySelector('action-bar bottom');

// my mod
console.log(actionBar);

const observer = new IntersectionObserver(callback, options);


// var styleSheet = "" +
//   "@media (min-width: 768px) and (max-width: 991px) {" +
//     ".container {" +
//       // uncomment the below css property to visually see when script is used
//       // "background-color: blue;" +
//       "width: 100%;" +
//     "}" +
//   "}" +
// "";

// (function () {
//   var s = document.createElement('style');
//   s.type = "text/css";
//   s.innerHTML = styleSheet;
//   (document.head || document.documentElement).appendChild(s);
// })();

