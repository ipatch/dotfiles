// ==UserScript==
// @name        freecadweb.org doom scroll 
// @namespace   Violentmonkey Scripts
// @match       https://forum.freecadweb.org/*
// @grant       GM.*
// @grant       GM_*
// @grant       unsafeWindow
// @run-at      document-end
// @version     1.0.31
// @author      github.com/ipatch
// @description to infiniti and beyond
// @downloadURL http://localhost/~capin/freecadForumDoomScroll.user.js
// @updateURL   http://localhost/~capin/freecadForumDoomScroll.user.js
// @supportURL  https://github.com/ipatch/dotfiles/issues
// @homepageURL https://github.com/ipatch/dotfiles
// ==/UserScript==

(function () {
'use strict';

  // NOTE: version number may require bumping on intial load to read updates
  //
  // REF: https://www.youtube.com/watch?v=Al-ZSuVHHM8 <- debounce explanation
  // REF: https://www.youtube.com/watch?v=T8EYosX4NOo <- intersect observer
  //
  // TOOD: setup some auto incrementing function to auto bump ver nums

  // EXAMPLES, tests /*{{{*/
  //------------------------------------
  // console.log('w00t'); // (un)comment after bumping ver # and test script update load
  console.log('violentmonkey, doom scroll hello!');
  // exp
  var mlife = 43;
  unsafeWindow.iVar1 = mlife;

  //---------------------------------------
  //
  // NOTE; able to access function via browser console for testing
  var multiplyES5 = function(x, y) {
    return x * y;
  };
  unsafeWindow.iVar2 = multiplyES5;

  //--------------------------------------------------
  //
  // NOTE: arrow func works with latest ver of Vivaldi
  // es6, fat arrow function, (arrow function)
  const multiplyES6 = (x, y) => {
    return x * y;
  };
  unsafeWindow.iVar3 = multiplyES6;
  //*}}}*/

  //---------------------------------------------------
  // BEGIN SCRIPT
  // my mod
  // const actionBar = document.querySelector('action-bar');
  const x = document.getElementById("page-body").querySelectorAll(".action-bar");
  unsafeWindow.iVar42 = x;

  // const options = {};

  // const observer = new IntersectionObserver(function(entries,
  // observer) {
  //   entries.forEach(entry => {
  //     console.log(entry);
  //   });
  // }, options);

  // observer.observe(actionBar);

})();

// vim: foldmethod=marker
