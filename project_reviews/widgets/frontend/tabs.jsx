import React from 'react';

class Tabs extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            selectedTab: 0
        };
        this.selectTab = this.selectTab.bind(this);
    }

    selectTab (num) {
        this.setState({ selectedTab: num });
    }

    render () {
        let pane = this.props.panes[this.state.selectedTab];

        return (
            <div>
                <h1>Tabs</h1>
                <div className="tabs-container">PANES</div>
            </div>
                    
        );
    }
}

export default Tabs;