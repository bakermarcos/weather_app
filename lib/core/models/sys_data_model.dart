class SysData {
  int? type;
  int? id;
  String? country;
  DateTime? sunrise;
  DateTime? sunset;

  SysData({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory SysData.fromJson(Map<String, dynamic> json) => SysData(
        type: json["type"] ?? 0,
        id: json["id"] ?? 0,
        country: json["country"] ?? "",
        sunrise: DateTime.fromMillisecondsSinceEpoch(json["sunrise"] ?? 0),
        sunset: DateTime.fromMillisecondsSinceEpoch(json["sunset"] ?? 0),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };

  SysData.empty() {
    type = 0;
    id = 0;
    country = "";
    sunrise = DateTime.fromMillisecondsSinceEpoch(0);
    sunset = DateTime.fromMillisecondsSinceEpoch(0);
  }
}
