function MovingObject (options) {
  this.pos = options.pos;  //[x,y]
  this.vel = options.vel; //[dx,dy]
  this.radius = options.radius;
  this.color = options.color;
}

MovingObject.prototype.draw = function (ctx) {
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI * 2);
};

MovingObject.prototype.move = function () {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
};
