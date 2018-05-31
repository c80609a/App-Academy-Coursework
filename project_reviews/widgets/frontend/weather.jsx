import React from 'react';

class Weather extends React.Component {
    constructor(props) {
        super(props);
        this.state = { weather: null,
                        error: false };
        this.pollWeather = this.pollWeather.bind(this);
    }


    componentDidMount () {
        navigator.geolocation.getCurrentPosition(this.pollWeather);
    }

    pollWeather(location) {

        // have to set up data from location to set up request url
        //OpenWeatherMap \
        // api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}
        let base_url = 'api.openweathermap.org/data/2.5/weather?';
        let lat = location.coords.latitude.toFixed(3);
        let long = location.coords.longitude.toFixed(3);

        let params = `lat=${lat}&lon=${long}`;
        
        const apiKey = '36c77f4e88e0f3755771a7fbef92de7f';
        let base_api = `&APPID=${apiKey}`;
    
        let full_url = base_url + params + base_api;
        console.log(full_url);

        let xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = () => {
            if (xmlhttp.readyState === XMLHttpRequest.DONE && xmlhttp.status === 200) {
                const data = JSON.parse(xmlhttp.responseText);
                this.setState({weather: data});
            } 
        };

        // opens request, default async is already true, but everyone seems to put it
         xmlhttp.open('GET', full_url, true);
         xmlhttp.send();

    }

    render () {
        let content = <div></div>;
        if (this.state.weather) {
            let weather = this.state.weather;
            let temp = (weather.main.temp - 273.15) * 1.8 + 32;
            content = <div className="weather-box">
                        <p>{weather.name}</p>
                        <p>{temp.toFixed(1)} deg</p>
                        </div>;
        } else {
            content = <div className="loading">loading...</div>;
        }

        return (
            <div>{content}</div>
        );
    }
}

export default Weather;