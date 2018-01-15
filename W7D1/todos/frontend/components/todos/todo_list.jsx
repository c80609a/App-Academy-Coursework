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
    const { todos, receiveTodo, removeTodo, createTodo, errors, updateTodo } = this.props;
    return (
      <div>
        <h2>Todo List!</h2>
        <ul>
          {
            todos.map((todo, i) => (<TodoListItem todo={todo}
                                                  key= {todo.id}
                                                  removeTodo={removeTodo}
                                                  receiveTodo={ receiveTodo }
                                                  updateTodo={ updateTodo }/>))
          }
        </ul>
        <TodoForm createTodo={ createTodo } errors={ errors } />
      </div>
    );


  }
}

export default TodoList;
