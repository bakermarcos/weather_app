class MainWeatherProperties {
// 	"main": {
// 		"temp": 298.21,
// 		"feels_like": 298.99,
// 		"temp_min": 295.78,
// 		"temp_max": 298.25,
// 		"pressure": 1017,
// 		"humidity": 85
// 	},

  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  MainWeatherProperties({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory MainWeatherProperties.fromJson(Map<String, dynamic> json) {
    return MainWeatherProperties(
      temp: json['temp'] ?? 0.0,
      feelsLike: json['feels_like'] ?? 0.0,
      tempMin: json['temp_min'] ?? 0.0,
      tempMax: json['temp_max'] ?? 0.0,
      pressure: json['pressure'] ?? 0,
      humidity: json['humidity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'pressure': pressure,
        'humidity': humidity,
      };

  MainWeatherProperties.empty() {
    temp = 0.0;
    feelsLike = 0.0;
    tempMin = 0.0;
    tempMax = 0.0;
    pressure = 0;
    humidity = 0;
  }
}
