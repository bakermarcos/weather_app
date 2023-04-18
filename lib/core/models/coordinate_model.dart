class Coordinate {
  double? lon;
  double? lat;

  Coordinate({this.lon, this.lat});

  Coordinate.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() => {'lon': lon, 'lat': lat};

  Coordinate.empty() {
    lon = 0.0;
    lat = 0.0;
  }
}
