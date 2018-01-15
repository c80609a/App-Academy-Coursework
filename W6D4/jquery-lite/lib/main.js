const DOMNodeCollection = require('./dom_node_collection.js');

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
