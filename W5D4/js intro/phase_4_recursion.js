const range = function (start,end) {
  const retArray = [];
  for(let i = start; i < end; i++) {
    retArray.push(i);
  }
  return retArray;
};

const sumRec = function (arr) {
  if (arr.length === 1) {
    return arr[0];
  }
  let sum = 0;
  let toAdd = arr.pop();
  return toAdd + sumRec(arr);
};

const exponent = function (base, exp) {
  if(exp === 0) {
    return 1;
  }
  return base * exponent(base, (exp - 1));
};

const fibonacci = function (n) {
  if (n <= 2) {
     return [0,1].slice(0, n);
  } else {
    var fibs = fibonacci(n - 1);
    fibs.push(fibs[fibs.length - 2] + fibs[fibs.length - 1]);
  }
  return fibs;
};

const bsearch = function (arr, target) {
  let midIdx = Math.floor(arr.length / 2);
  // debugger;
  let midEl = arr[midIdx];
  console.log(`${arr}`);
  if (arr.length === 0) {
    return -1;
  } else if (midEl === target) {
    return midIdx;
  } else if (target < midEl) {
    return bsearch(arr.slice(0, midIdx), target);
  } else {
    if (bsearch(arr.slice(midIdx + 1, arr.length), target) === -1) {
      return  -1;
    } else {
      return (midIdx + bsearch(arr.slice(midIdx, arr.length), target));
    }
  }

};

const merge = function (left, right) {
  let retArray = [];
  while ((left.length !== 0) && (right.length !== 0)) {
    if (left[0] > right[0]) {
      retArray.push(right.shift());
    } else {
      retArray.push(left.shift());
    }
  }
  retArray = retArray.concat(left);
  retArray = retArray.concat(right);
  return retArray;
};

const mergesort = function (arr) {
  if (arr.length === 1) {
    return arr;
  }
  // console.log(arr);
  let midIdx = Math.floor(arr.length / 2);
  let leftSide = arr.slice(0, midIdx);
  let rightSide = arr.slice(midIdx, arr.length);
  

  const sorted_left = mergesort(leftSide);
  const sorted_right = mergesort(rightSide);
  return merge(sorted_left, sorted_right);

};
