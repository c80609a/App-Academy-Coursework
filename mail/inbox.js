const MessageStore = require('./message_store.js');

const Inbox = {
  render: function () {
    const newUl = document.createElement('ul');
    newUl.className = "messages";
    const inboxMessages = MessageStore.getInboxMessages();
    inboxMessages.forEach((el) => {
      const renderedMessage = this.renderMessage(el);
      newUl.appendChild(renderedMessage);
    });

    return newUl;
  },

  renderMessage: (message) => {
    const newLi = document.createElement('li');
    newLi.className = "message";

    const fromSpan = document.createElement("span");
    fromSpan.className = "from";
    fromSpan.innerHTML = `${message.from}`;
    const subjectSpan = document.createElement("span");
    subjectSpan.className = "subject";
    subjectSpan.innerHTML = `${message.subject}`;
    const bodySpan = document.createElement("span");
    bodySpan.className = "body";
    bodySpan.innerHTML = `${message.body}`;
    return newLi;
  }
};

module.exports = Inbox;
