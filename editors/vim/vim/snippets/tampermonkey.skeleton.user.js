// ==UserScript==
// @name        [name.of.script]
// @namespace   [url]
// @version     [sem.var]
// @description [short.synopsis.of.what.script.does]
// @author      [me]
// @match       [url.for.script.act.upon]
// @grant       none
// @downloadURL [url], ie. [http://localhost/~$USER/tampermonkey.skeleton.user.js
// @updateURL   [url], ie. [http://localhost/~$USER/tampermonkey.skeleton.user.js
// ==/UserScript==

(function () {
  'use strict';

  const style = document.createElement('style');

  style.innerHTML =
    .target-css-class htmlElement {
      min-height: 300px; /* normally 100px */
      max-height: 600px; /* normally 300px */
    }
  ;

  document.head.appendChild(style);
})();


    
