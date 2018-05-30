import React from 'react';

class Weather extends React.Component {
    constructor(props) {
        super(props);
        this.state = {};
        this.pollWeather = this.pollWeather.bind(this);
    }


    componentDidMount () {
        navigator.geolocation.getCurrentPosition(this.pollWeather);
    }

    pollWeather(location) {
        
    }

    render () {
        return (
            <div>Hi.</div>
        );
    }
}

export default Weather;