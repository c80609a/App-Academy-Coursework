const Router = require('./router.js');

document.addEventListener('DOMContentLoaded', () => {
  const navBarLis = document.querySelectorAll('.sidebar-nav li');
  const navBarListItems = Array.from(navBarLis);

  navBarListItems.forEach((el) => {
    el.addEventListener('click', (event) => {
      event.preventDefault();
      let newLoc = el.innerText.toLowerCase();
      window.location.hash = newLoc;

      const content = document.querySelector('.content');
      const rtr = new Router(content);
      rtr.start();
    });
  });
});
