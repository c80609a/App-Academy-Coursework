import React from 'react';
import merge from 'lodash/merge';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.toggleDone = this.toggleDone.bind(this);

  }

  toggleDone(e) {
    e.preventDefault();
    const toggledTodo = merge({}, this.props.todo, { done: !this.props.todo.done });

    this.props.receiveTodo(toggledTodo);
  }

  render () {
    const { todo } = this.props;
    const { title, done } = todo;
    return (
      <li>
        {title}
        <button onClick={this.toggleDone}>{ done ? "Mark Undone" : "Done"}</button>
        <button onClick={this.props.removeTodo}>Delete</button>
      </li>
    );
  }

}

export default TodoListItem;
