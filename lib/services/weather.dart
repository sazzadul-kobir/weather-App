class WeatherModel {
  Map<String,String> getWeatherIconndBackgroundimg(int condition) {
    if (condition < 300) {
      return {
        "icon":'🌩',
        "background":'assets/svg/thunderstrom.svg'
      };
    } else if (condition < 400) {
      return {
        "icon":'🌧',
        'background':'assets/svg/drizzle.svg'
      };
    } else if (condition < 600) {
      return {
        'icon':'☔️',
        'background':'assets/svg/rain.svg'
      };
    } else if (condition < 700) {
      return {
        'icon':'☃️',
        'background':'assets/svg/snow.svg'
      };
    } else if (condition < 800) {
      return {
        'icon':'🌫',
        'background':'assets/svg/haze.svg'
      };
    } else if (condition == 800) {
      return {
        'icon':'☀️',
        'background':'assets/svg/sunnyday.svg'
      };
    } else if (condition <= 804) {
      return {
        'icon':'☁️',
        'background':'assets/svg/clouds.svg'
      };
    } else {
      return {
        'icon':'🤷‍',
        'background':'assets/svg/else.svg'
      };
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}