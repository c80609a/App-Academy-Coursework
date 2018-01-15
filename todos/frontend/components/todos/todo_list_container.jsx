import { connect } from 'react-redux';
import TodoList from './todo_list';
import allTodos from '../../reducers/selectors';
import { receiveTodo, receiveTodos, removeTodo, fetchTodos, createTodo, updateTodo } from '../../actions/todo_actions';

const mapStateToProps = (state) => ({
  todos: allTodos(state),
  errors: state.errors
});

const mapDispatchtoProps = (dispatch) => ({
  createTodo: (todo) => dispatch(createTodo(todo)),
  removeTodo: (todo) =>  dispatch(removeTodo(todo)),
  fetchTodos: (todos) => dispatch(fetchTodos()),
  updateTodo: (todo) => dispatch(updateTodo(todo))
});


export default connect(mapStateToProps, mapDispatchtoProps)(TodoList);
