const Util = {
  inherits: function(childClass, parentClass){
    childClass.prototype = Object.create(parentClass.prototype);
    childClass.prototype.constructor = childClass;
  }
};

function scale (vec, m) {
  return [vec[0] * m, vec[1] * m];
}

module.exports = Util;
