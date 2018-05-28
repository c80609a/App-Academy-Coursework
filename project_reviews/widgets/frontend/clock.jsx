import React from 'react';

class Clock extends React.Component {
  constructor() {
    super();
    this.state = {
      now: new Date()
    };
    this.tick = this.tick.bind(this);
  }

  tick () {
    this.setState({ now: new Date()});
  }

  componentDidMount () {
    this.intervalId = setInterval(this.tick, 1000);
  }

  componentWillUnmount () {
    clearInterval(this.intervalId);
  }


  render() {

    let hours = this.state.now.getHours();
    let mins = this.state.now.getMinutes();
    let secs = this.state.now.getSeconds();

    hours = (hours < 10) ? `0${hours}` : hours;
    mins = (mins < 10) ? `0${mins}` : mins;
    secs = (secs < 10) ? `0${secs}` : secs;
    // secs = `0${secs}`;

    return (
      <div className="clock-widget">
        <div className="clock-container">
          <span className="time-container">{hours}:{mins}:{secs}</span>
          <span className="date-container">{this.state.now.toLocaleDateString()}</span>
        </div>
      </div>
      );
    }
  }
  
export default Clock;
