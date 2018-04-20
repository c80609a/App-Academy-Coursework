import React from 'react';
import Clock from './clock';
// import Tabs from './tabs';

class Root extends React.Component {
  // const tabbies = [{title: "one", content: "hi"}, {title: "one", content: "hi"} ];
  constructor () {
    super ();
  }

  render () {
    return (
      <div>
        <Clock />
      </div>
    );
  }
}
// <Tabs />

export default Root;
