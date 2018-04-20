import React from 'react';

class Clock extends React.Component {
  constructor() {
    super();
    const datedata = new Date();
    this.state = { date: datedata };
    this.tick = this.tick.bind(this);

  }
  componentDidMount() {
    this.tickId = setInterval(this.tick, 1000);
  }
  componentWillUnmount() {
    clearInterval(this.tickId);
  }

  tick() {
    const date = new Date();
    this.setState({ date });
  }

  render() {
    let hours = this.state.date.getHours() % 12;
    let minutes = this.state.date.getMinutes();
    let seconds = this.state.date.getSeconds();
    let month = this.state.date.getMonth();
    let day = this.state.date.getDay();
    let year = this.state.date.getFullYear();

    return (
      <div>
        <h1>Spooky Clock</h1>
        <div className="clock-container">
          <p>
            <span className="left">
              Time:
            </span>
            <span>
              {hours}:{minutes}:{seconds}
            </span>
          </p>
          <p>
            <span className="left">
              Date:
            </span>
            <span>
              {month}/{day}/{year}
            </span>
          </p>
        </div>
      </div>
    );
  }
}


export default Clock;
