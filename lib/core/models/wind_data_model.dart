class WindData {
  // 	"wind": {
  // 		"speed": 6.69,
  // 		"deg": 110
  // 	},

  double? speed;
  int? deg;

  WindData({this.speed, this.deg});

  WindData.fromJson(Map<String, dynamic> json) {
    speed = double.tryParse(json['speed'].toString()) ?? 0.0;
    deg = json['deg'] ?? 0;
  }

  Map<String, dynamic> toJson() => {'speed': speed, 'deg': deg};

  WindData.empty() {
    speed = 0.0;
    deg = 0;
  }
}
