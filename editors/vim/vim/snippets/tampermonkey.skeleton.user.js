// ==UserScript==
// @name        [name.of.script]
// @namespace   Violentmonkey Scripts
// @match       [url.for.script.act.upon]
// @grant       none
// @run-at      [see.API], ie. `document-start`
// @version     [sem.var], ie. 1.0
// @author      [me], ie. github.com/ipatch
// @description skeleton violentmonkey userscript for editing CSS
// @downloadURL [url], ie. [http://localhost/~$USER/tampermonkey.skeleton.user.js
// @updateURL   [url], ie. [http://localhost/~$USER/tampermonkey.skeleton.user.js
// ==/UserScript==

console.log('violentmonkey script loaded');

var styleSheet = "" +
".css-class {" +
  "background-color: pink;" +
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

