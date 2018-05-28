import React from 'react';
import ReactDOM from 'react-dom';

import Clock from './clock';
import Tabs from './tabs';

const Panes = [
  {title: 'Tab 1', content: "The mighty first."},
  {title: 'Tab 2', content: "The middle second."},
  {title: 'Tab 3', content: "Third and last."}
];

function Root() {
  return(
    <div>
      <Clock />
      <Tabs panes={Panes} />
    </div>
  )
}

document.addEventListener('DOMContentLoaded', function () {
  ReactDOM.render(<Clock />, document.getElementById("main"));
});
