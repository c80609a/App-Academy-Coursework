function curry(numArgs) {
  var arr = [];

  function curried (arg) {
    arr.push(arg);
    if (arr.length === numArgs) {
      var sum = 0;
      arr.forEach(e => {
        sum += e;
      });
      return sum;
    } else {
      return curried;
    }
  }

  return curried;
}

const sum = curry(4);
console.log(sum(5)(30)(20)(1)); // => 56


// function curries(arg){
//   return function(arg1){
//     return function(arg2){
//       return function(arg3){
//         return arg + arg1 + arg2 + arg3;
//       };
//     };
//   };
// }
//
// console.log(curries(5,3,2,1,3)(30)(20)(1) === 56);
