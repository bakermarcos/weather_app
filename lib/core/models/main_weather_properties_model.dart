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
      temp: double.tryParse(json['temp'].toString()) ?? 0.0,
      feelsLike: double.tryParse(json['feels_like'].toString()) ?? 0.0,
      tempMin: double.tryParse(json['temp_min'].toString()) ?? 0.0,
      tempMax: double.tryParse(json['temp_max'].toString()) ?? 0.0,
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
