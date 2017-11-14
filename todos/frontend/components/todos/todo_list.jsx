import React from 'react';
import allTodos from '../../reducers/selectors';
import TodoListItem from './todo_list_item';

const TodoList = ({ todos }) => {
  return (
    <ul>
      {
        todos.map((todo, i) => (<TodoListItem todo={todo} key={i}/>))
      }
    </ul>
  );
};

export default TodoList;
