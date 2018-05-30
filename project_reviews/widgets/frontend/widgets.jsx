import React from 'react';
import ReactDOM from 'react-dom';

import Clock from './clock';
import Tabs from './tabs';
import Weather from './weather';

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
      <Weather />
    </div>
  )
}

document.addEventListener('DOMContentLoaded', function () {
  ReactDOM.render(<Root />, document.getElementById("main"));
});
