// sum
//
// Write a sum function that takes any number of arguments:
// Solve it first using the arguments keyword, then rewrite your solution to use the ... rest operator.

// function sum(...args){
//   let acc = 0;
//   args.forEach((e)=>{ acc += e;});
//   return acc;
// }
// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);
//

// bind with args
//
// Rewrite your myBind method so that it can take both bind-time arguments and call-time arguments.
//
// A few examples:
//
// class Cat {
//   constructor(name) {
//     this.name = name;
//   }
//
//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }
//
// Function.prototype.myBind = function (theBindObj){
//   var x = this;
//   var boundArgs = Array.from(arguments).slice(1);
//   return function(){
//     var extraArggs = Array.from(arguments);
//     return x.apply(theBindObj, boundArgs.concat(extraArggs));
//   };
// };
//
// Function.prototype.myBind = function(theBindObj2, ...args){
//   return (...extraArgs)=>{
//     return this.apply(theBindObj2, args.concat(extraArgs));
//   };
// };
//
// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
//
// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true
//
// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(breakfast, "meow", "Kush")();
// // Breakfast says meow to Kush!
// // true
//
// // no bind time args (other than context), call time args are "meow" and "me"
// markov.says.myBind(breakfast)("meow", "a tree");
// // Breakfast says meow to a tree!
// // true
//
// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(breakfast, "meow")("Markov");
// // Breakfast says meow to Markov!
// // true
//
// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");
// // Breakfast says meow to me!
// // true

function curries(arg){
  return function(arg1){
    return function(arg2){
      return function(arg3){
        return arg + arg1 + arg2 + arg3;
      };
    };
  };
}

console.log(curries(1)(2)(3)(4) === 10);
