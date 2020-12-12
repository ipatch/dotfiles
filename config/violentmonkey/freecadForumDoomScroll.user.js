// ==UserScript==
// @name        freecadweb.org doom scroll 
// @description to infiniti and beyond
// @author      github.com/ipatch
// @namespace   Violentmonkey Scripts
// @homepageURL https://github.com/ipatch/dotfiles
// @supportURL  https://github.com/ipatch/dotfiles/issues
// @icon
// @match       https://forum.freecadweb.org/*
// @grant       GM.*
// @grant       GM_*
// @run-at      document-end
// @version     1.0.32
// @downloadURL http://localhost/~/capin/freecadForumDoomScroll.user.js
// @updateURL   http://localhost/~/capin/freecadForumDoomScroll.user.js
// ==/UserScript==

(function () {
'use strict';

  // NOTE: version number may require bumping on intial load to read updates
  //
  // REF: https://www.youtube.com/watch?v=Al-ZSuVHHM8 <- debounce explanation
  // REF: https://www.youtube.com/watch?v=T8EYosX4NOo <- intersect observer
  // REF: https://www.w3schools.com/xml/xml_http.asp
  // REF: https://code-boxx.com/infinite-page-scroll/
  // REF: https://medium.com/better-programming/everything-about-xmlhttprequest-in-javascript-8adacc98a209
  //
  // TOOD: setup some auto incrementing function to auto bump ver nums
  // console.log('w00t'); // (un)comment after bumping ver # and test script update load
  //
  // NOTE: i believe first topic of thread is indexed at `0` and page 2, ie. post 10 == 11 if index were to start at `1`

  // EXAMPLES, tests /*{{{*/
  //------------------------------------
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

  // XMLHttpRequest example  ----------- {{{
    // 1. define URL
    // 2. define request object
    // 3. open request, ie. use GET or POST
    // 4. use `onload` function log results
    // 5. set `responseType` ie. document
    // 6. send request
  // EXAMPLE,
    // let myURL = "https://forum.freecadweb.org/viewtopic.php?f=10&t=13710&start=10";
    // let myRequest = new XMLHttpRequest();
    // myRequest.open("GET", myURL);
    // myRequest.onload = function(){
    //   console.log(myRequest.response);
    // }
    // myRequest.responseType = "document";
    // myRequest.send();
  // }}}


  //---------------------------------------------------
  // BEGIN SCRIPT
  // my mod
  // const actionBar = document.querySelector('action-bar');
  // const actionBar = document.getElementById("page-body").querySelectorAll(".action-bar");


  // css
  const css = `
  .css-class: {
    position: relative;
  }
  `;


  let pageFooter = document.getElementById('page-footer');
  unsafeWindow.iVar42 = pageFooter;

  let options = {
    root: document.querySelector("#page-body"),
    rootMargin: "0px",
    threshold: 1.0
  };

  // let target = document.querySelectorAll(".action-bar");
  let target = pageFooter;

  function handleIntersection(entries) {
    entries.map((entry) => {
      if (entry.isIntersecting) {
        console.log('target sighted');
      }
    });
  }

  let observer = new IntersectionObserver(handleIntersection);

  observer.observe(target);

})(); // iffe, END

// vim: foldmethod=marker
