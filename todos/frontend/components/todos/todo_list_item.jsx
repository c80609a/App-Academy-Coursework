import React from 'react';
import merge from 'lodash/merge';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.toggleDone = this.toggleDone.bind(this);
    this.removeTodo = this.removeTodo.bind(this);
  }

  toggleDone(e) {
    e.preventDefault();
    const toggledTodo = merge({}, this.props.todo, { done: !this.props.todo.done });

    this.props.receiveTodo(toggledTodo);
  }

  removeTodo(e) {
    e.preventDefault();
    this.props.removeTodo(this.props.todo);
  }

  render () {
    const { todo, removeTodo } = this.props;
    const { title, done } = todo;
    return (
      <li>
        {title}
        <button onClick={this.toggleDone}>{ done ? "Mark Undone" : "Done"}</button>
        <button onClick={this.removeTodo}>Delete</button>
      </li>
    );
  }

}

export default TodoListItem;
