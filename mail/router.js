class Router {
  constructor (node) {
    this.node = node;
  }

  start () {
    this.render();
    this.node.addEventListener('hashchange', (event) => {
      event.preventDefault();
      this.render();
    });

  }

  render () {
    debugger;
    this.node.innerHTML = "";
    let routeName = this.activeRoute();
    const newP = document.createElement('p');
    newP.innerHTML = routeName;
    this.node.appendChild(newP);
  }

  activeRoute() {
    const hashFrag = window.location.hash;
    return hashFrag.slice(1);
  }
}

module.exports = Router;
