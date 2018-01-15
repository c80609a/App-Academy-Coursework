var Game = require('./game.js');


function GameStop(ctx){
  this.game = new Game();
  this.ctx = ctx;
}


GameStop.prototype.start = function(){
  setInterval(this.game.draw(), 20);
  setInterval(this.game.movObjects(), 20);
};
