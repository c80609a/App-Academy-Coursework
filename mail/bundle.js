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

const Router = __webpack_require__(1);
const Inbox = __webpack_require__(2);

document.addEventListener('DOMContentLoaded', () => {
  const navBarLis = document.querySelectorAll('.sidebar-nav li');
  const navBarListItems = Array.from(navBarLis);

  navBarListItems.forEach((el) => {
    el.addEventListener('click', (event) => {
      event.preventDefault();
      let newLoc = el.innerText.toLowerCase();
      window.location.hash = newLoc;

      const content = document.querySelector('.content');
      const rtr = new Router(content, routes);
      rtr.start();
    });
  });
});

const routes = {
  // compose:
  inbox: Inbox
  // sent:
};


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class Router {
  constructor (node, routes) {
    this.node = node;
    this.routes = routes;
  }

  start () {
    this.render();
    this.node.addEventListener('hashchange', (event) => {
      event.preventDefault();
      this.render();
    });

  }

  render () {
    let component = this.activeRoute();
    if (component === undefined) {
      this.node.innerHTML = "";
    } else {
      this.node.innerHTML = "";
      this.node.appendChild(component.render());
      // const newP = document.createElement('p');
      // newP.innerHTML = routeName;
      // this.node.appendChild(newP);
    }

  }

  activeRoute() {
    const hashFrag = window.location.hash.slice(1);
    return this.routes[hashFrag];
  }
}

module.exports = Router;


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const MessageStore = __webpack_require__(3);

const Inbox = {
  render: function () {
    const newUl = document.createElement('ul');
    newUl.className = "messages";
    const inboxMessages = MessageStore.getInboxMessages();
    inboxMessages.forEach((el) => {
      const renderedMessage = this.renderMessage(el);
      newUl.appendChild(renderedMessage);
    });

    return newUl;
  },

  renderMessage: (message) => {
    const newLi = document.createElement('li');
    newLi.className = "message";

    const fromSpan = document.createElement("span");
    fromSpan.className = "from";
    fromSpan.innerHTML = `${message.from}`;
    const subjectSpan = document.createElement("span");
    subjectSpan.className = "subject";
    subjectSpan.innerHTML = `${message.subject}`;
    const bodySpan = document.createElement("span");
    bodySpan.className = "body";
    bodySpan.innerHTML = `${message.body}`;
    return newLi;
  }
};

module.exports = Inbox;


/***/ }),
/* 3 */
/***/ (function(module, exports) {

let messages = {
  sent: [
    {to: "friend@mail.com", subject: "Check this out", body: "It's so cool"},
    {to: "person@mail.com", subject: "zzz", body: "so booring"}
  ],
  inbox: [
    {from: "grandma@mail.com", subject: "Fwd: Fwd: Fwd: Check this out", body: "Stay at home mom discovers cure for leg cramps. Doctors hate her"},
    {from: "person@mail.com", subject: "Questionnaire", body: "Take this free quiz win $1000 dollars"}
  ]
};

const MessageStore = {
  getInboxMessages: () => {
    return messages.inbox;
  },
  getSentMessages: () => {
    return messages.sent;
  }
};

module.exports = MessageStore;


/***/ })
/******/ ]);