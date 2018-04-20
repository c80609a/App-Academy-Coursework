const Cat = function Cat(name, owner, store) {
  this.name = name;
  this.owner = owner;
  this.store = store;
};

Cat.prototype.cuteStatement = function() {
  console.log(`${this.owner} loves ${this.name}`);
};

const fluff = new Cat('Fluffy', 'B', 'petStore');
