class Coordinate {
  double? lon;
  double? lat;

  Coordinate({this.lon, this.lat});

  Coordinate.fromJson(Map<String, dynamic> json) {
    lon = double.tryParse(json['lon'].toString())??0.0;
    lat = double.tryParse(json['lat'].toString())??0.0;
  }

  Map<String, dynamic> toJson() => {'lon': lon, 'lat': lat};

  Coordinate.empty() {
    lon = 0.0;
    lat = 0.0;
  }
}
