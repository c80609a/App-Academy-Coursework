var Asteroid = ('./asteroid.js');


const DIM_X = 1600;
const DIM_Y = 1000;
const NUM_ASTEROIDS = 10;


function Game(){
  this.asteroids = this.addAsteroids();
}

var asteroidsArr = [];
Game.prototype.addAsteroids = function(){
  //randomly place asteroids within the dimensions of the grid.
  for(var i = 0; i < NUM_ASTEROIDS; i++){
    var options = {
      pos: this.randomPosition()
    };
    var asteroid = new Asteroid(options);

    asteroidsArr.push(asteroid);
  }
  return asteroidsArr;
};

Game.prototype.randomPosition = function(){
 var x = Math.floor(Math.random() * DIM_X);
 var y = Math.floor(Math.random() * DIM_Y);
 return [x, y];
};


Game.prototype.draw = function(ctx){
    ctx.clearRect();
    this.asteroids.forEach((asteroid) =>{
      asteroid.draw(ctx);
    });
    //clear rect & ctx
};

Game.prototype.moveObjects = function(){
  this.asteroids.forEach(a => a.move());
};
