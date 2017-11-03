Array.prototype.uniq = function () {
  const retArray = [];
  for (let i = 0; i < this.length; i++) {
    if (retArray.includes(this[i])) {
      continue;
    } else {
      retArray.push(this[i]);
    }
  }
  return retArray;
};

Array.prototype.twoSum = function () {
  const retArray = [];
  for (let i = 0; i < (this.length - 1); i++) {
    for (let j = 1; j < this.length; j++) {
      if ((this[i] + this[j]) === 0) {
        retArray.push([i,j]);
      }
    }
  }
  return retArray;
};

Array.prototype.transpose = function () {
  const retArray = [];
  for (let i = 0; i < this.length; i++) {
    let rowArray = [];
    for (let j = 0; j < this[0].length; j++) {
      rowArray.push(this[j][i]);
    }
    retArray.push(rowArray);
  }
  return retArray;
};
