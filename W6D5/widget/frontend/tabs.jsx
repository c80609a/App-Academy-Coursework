import React from 'react';

class Tabs extends  React.Component {
  constructor (props) {
    super(props);
    this.tabs = props.tabs;
    this.state = { selectedTabIndex: 0 };
  }

  render () {
    return (
      <ul>
        {
          this.tabs.map((el) => <li>el.title</li> )
        }
      </ul>
  );
  }

}

export default Tabs;


//

// props = {
//   tabs: [{name: title, content: "some words"}, {k:v}, {k:v}],
//   names: [name1, name2, name3]
// }
