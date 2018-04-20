Array.prototype.myEach = function (cb) {
  for (let i = 0; i < this.length; i++) {
    cb(this[i]);
  }
};

const a = function (arg) {
  console.log(arg);
};


Array.prototype.myMap = function (cb) {
  const retArray = [];
  this.myEach(el => retArray.push(cb(el)));
  return retArray;
};

// const double = function (el) {
//   return (el * 2);
// };

Array.prototype.myReduce = function (cb, iv) {
    let initialValue = iv || this[0];
    if (iv) {
      for (let i = 0; i < this.length; i++) {
        initialValue = cb(initialValue, this[i]);
      }
    } else {
      for (let i = 1; i < this.length; i++) {
        initialValue = cb(initialValue, this[i]);
      }
    }
    return initialValue;
};

const add = function(acc, el) {
  return (acc + el);
};
