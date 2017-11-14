import React from 'react';
import uniqueId from '../../util/uniqueId';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { title: "", body: "", done: false };
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  updateTitle (event) {
    this.setState({ title: event.target.value });
  }

  updateBody (event) {
    this.setState({ body: event.target.value });
  }

  handleSubmit(event) {
    event.preventDefault();
    const todo = Object.assign({}, this.state, { id: uniqueId() });
    this.props.receiveTodo(todo);
    this.setState({ title: "", body: "" });
  }

  render () {
    return (
      <div>
        <form onSubmit={ this.handleSubmit }>
          <label>Title:</label>
          <input type="text" name="" value={ this.state.title } onChange={ this.updateTitle }></input>
          <br />
          <label>Body:</label>
          <textarea name="name" rows="8" cols="80" value = { this.state.body } onChange={ this.updateBody }></textarea>
          <br />
          <button>Create</button>
        </form>

      </div>
    );
  }

}

export default TodoForm;
