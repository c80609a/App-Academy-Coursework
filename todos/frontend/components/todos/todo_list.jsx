import React from 'react';
import allTodos from '../../reducers/selectors';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  // todos, receiveTodo, removeTodo, fetchTodos
  constructor (props) {
    super(props);

  }

  componentDidMount () {
    this.props.fetchTodos();
  }


  render () {
    const { todos, receiveTodo, removeTodo } = this.props;
    return (
      <div>
        <h2>Todo List!</h2>
        <ul>
          {
            todos.map((todo, i) => (<TodoListItem todo={todo} key= {todo.id} removeTodo={removeTodo} receiveTodo={ receiveTodo }/>))
          }
        </ul>
        <TodoForm receiveTodo={ receiveTodo } />
      </div>
    );


  }
}

export default TodoList;
