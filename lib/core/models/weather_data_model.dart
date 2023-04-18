class WeatherData {
// "weather": [
// 		{
// 			"id": 500,
// 			"main": "Rain",
// 			"description": "light rain",
// 			"icon": "10n"
// 		}

  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherData({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        id: json["id"] ?? 0,
        main: json["main"] ?? "",
        description: json["description"] ?? "",
        icon: json["icon"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };

  WeatherData.empty() {
    id = 0;
    main = "";
    description = "";
    icon = "";
  }

}
