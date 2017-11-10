const Inbox = {
  render: function () {
    const newUl = document.createElement('ul');
    newUl.className = "messages";
    newUl.innerHTML = "An Inbox Message";
    return newUl;
  }
};

module.exports = Inbox;
