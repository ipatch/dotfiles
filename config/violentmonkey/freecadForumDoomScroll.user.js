// ==UserScript==
// @name        freecadweb.org doom scroll 
// @description to infiniti and beyond
// @author      github.com/ipatch
// @namespace   Violentmonkey Scripts
// @homepageURL https://github.com/ipatch/dotfiles
// @supportURL  https://github.com/ipatch/dotfiles/issues
// @icon
// @match       https://forum.freecadweb.org/viewtopic.php*
// @exclude-match https://forum.freecadweb.org/posting.php*
// @grant       GM.*
// @grant       GM_*
// @run-at      document-end
// @version     1.0.32
// @downloadURL http://localhost/~/capin/freecadForumDoomScroll.user.js
// @updateURL   http://localhost/~/capin/freecadForumDoomScroll.user.js
// ==/UserScript==

(function () {
'use strict';

  // TODO: the URL and page number need to be updated after a page is loaded, ie.
  // as this presently works the contents of page 2 will load into the dom but page 1
  // will still appear to be the active page (button) and the URL in the address
  // bar nees to be updated accordingly

  // NOTE: version number may require bumping on intial load to read updates
  //
  // REF: https://www.youtube.com/watch?v=Al-ZSuVHHM8 <- debounce explanation
  // REF: https://www.youtube.com/watch?v=T8EYosX4NOo <- intersect observer
  // REF: https://www.w3schools.com/xml/xml_http.asp
  // REF: https://code-boxx.com/infinite-page-scroll/
  // REF: https://medium.com/better-programming/everything-about-xmlhttprequest-in-javascript-8adacc98a209
  // REF: https://www.youtube.com/watch?v=4K33w-0-p2c
  // REF: https://openuserjs.org/scripts/tumpio/Endless_Google
  // REF: https://wiki.greasespot.net/Tutorials
  //
  // console.log('w00t'); // DEBUG
  //
  // NOTE: i believe first topic of thread is indexed at `1` and page 2, ie. post 10 refers to the 11th post of a thread, but is the 10th reply
  // NOTE: pg2 button puts `&start=10` at the end of the `viewtopic.php` URL
    // NOTE: pg2 contains replies 10 through 19, ie. each page has 10 posts

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
    // 5. set `responseType` ie. document (HTML), JSON 
      // https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/response
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

// regular expression to match only div id cotaining post(s) & reply(s) {{{
  //
  // REF: https://scriptular.com
  //
  // `/^[pP]{1}\d+[0-9]$/` everything contained within the backticks
  //
  // }}}

  // wrap a nodelist within a div {{{
  // REF: https://stackoverflow.com/a/59581407/708807

  //---------------------------------------------------
  // BEGIN SCRIPT
  //
  // encapsulate topic in html section with classname `ds-thread-wrapper` {{{
  var dsSibling = document.querySelector('.action-bar.top');
  var children = document.querySelectorAll('.post');
  var dsThreadWrapper = document.createElement('section');

  dsThreadWrapper.className = 'ds-thread-wrapper';

  children.forEach((child) => {
    dsThreadWrapper.appendChild(child);
  });

  dsSibling.after(dsThreadWrapper);
  //----- }}}
  
  // Setting up URL dom structures {{{
  
  // store current URL in js var
  var dsNextPageBtnUrl = document.querySelector('.arrow.next').firstElementChild.getAttribute('href');

  unsafeWindow.iVarNextPageURL = dsNextPageBtnUrl;
  console.log(iVarNextPageURL);

  // Setup XMLHttpRequest - {{{
  var dsRequest = new XMLHttpRequest();
  dsRequest.open('GET', dsNextPageBtnUrl);

  dsRequest.onload = function() {
    // console.log(dsRequest.response); // DEBUG
    //
    var dsNextPagePosts = dsRequest.response; 

    var replies = dsNextPagePosts.querySelectorAll('.post');

    replies.forEach((reply) => {
      dsThreadWrapper.appendChild(reply);
    });
  };

  dsRequest.responseType = 'document';
  dsRequest.send();
  // use above URL as GET for xmlhttpreques  // - }}}

  // Q: howto store/get contents of retreieved doc ?


  // 1. grab just posts from response doc, store in js var
  // 2. append js posts var to bottom of ds-thread-wrapper-class



  //--------}}}

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
