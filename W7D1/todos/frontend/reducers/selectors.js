const allTodos = (state) => (
  //needs to return an array
  Object.keys(state.todos).map(id => state.todos[id])

);

export default allTodos;
