/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DOMNodeCollection = __webpack_require__(1);

Window.prototype.$l = function (arg) {
  if (typeof arg === 'string') {
    const arrayLikeObject = document.querySelectorAll(arg);
    return new DOMNodeCollection(Array.from(arrayLikeObject));
  }
  if (arg instanceof HTMLElement) {
    const tempArray = Array.from(arg);
    return new DOMNodeCollection(tempArray);
  }

};


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class DOMNodeCollection {
  constructor (array) {
    this.htmlEls = array;
  }

  html (string) {
    if (string) {
      this.htmlEls.map((el) => {
        el.innerHTML = string;
      });
    } else {
      return this.htmlEls[0].innerHTML;
    }
  }

  empty () {
    this.htmlEls.map((el) => {
      el.innerHTML = "";
    });
  }

  append (item) {
    //$l collection, htmlEl, string
    //for each el, append outerHTML of the item
    // to the innerHTML of the el
    this.htmlEls.map((el) => {
      el.innerHTML += item;
    });
  }

  attr (name, value) {
    //pass item with {name: value, attrVal: value}

    this.htmlEls.map((el) => {
      if (value === undefined){
        el.removeAttribute(name);
      } else {
        el.setAttribute(name, value);
      }
    });
  }

  addClass(cName) {
    this.htmlEls.map((el) => {
      if (el.className.length === 0) {
        el.className += cName;
      } else {
        el.className += " " + cName;
      }
    });
  }

  removeClass(cName) {
    this.htmlEls.map((el) => {
      if (cName === undefined) {
        el.removeAttribute("class");
      } else {
        el.classList.remove(cName);
      }
    });
  }
}

module.exports = DOMNodeCollection;


/***/ })
/******/ ]);