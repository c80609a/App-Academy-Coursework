class Router {
  constructor (node, routes) {
    this.node = node;
    this.routes = routes;
  }

  start () {
    this.render();
    this.node.addEventListener('hashchange', (event) => {
      event.preventDefault();
      this.render();
    });

  }

  render () {
    let component = this.activeRoute();
    if (component === undefined) {
      this.node.innerHTML = "";
    } else {
      this.node.innerHTML = "";
      this.node.appendChild(component.render());
      // const newP = document.createElement('p');
      // newP.innerHTML = routeName;
      // this.node.appendChild(newP);
    }

  }

  activeRoute() {
    const hashFrag = window.location.hash.slice(1);
    return this.routes[hashFrag];
  }
}

module.exports = Router;
