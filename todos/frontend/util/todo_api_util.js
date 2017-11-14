const getTodos = () => (
  $.ajax ({
  url: "/api/todos",
  method: "GET",
  })
);

export default getTodos;
