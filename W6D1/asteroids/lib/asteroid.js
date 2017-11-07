var MovingObject = require('./moving_object.js');
var Util = require('./utils.js');


function Asteroid(options = {}){

    options.pos = options.pos || [25, 25];
    options.vel = randomVec(this.SPEED);
    options.radius = this.RADIUS;
    options.color = this.COLOR;

  MovingObject.call(this, options);

}

Util.inherits(Asteroid, MovingObject);

Asteroid.COLOR = "red";
Asteroid.RADIUS = 25;
Asteroid.SPEED = 4;

// function scale (vec, m) {
//   return [vec[0] * m, vec[1] * m];
// }

function randomVec(length) {
  const deg = 2 * Math.PI * Math.random();
  return Util.scale([Math.sin(deg), Math.cos(deg)], length);
}

new Asteroid({ pos: [30, 30]});
