class RainData {
  //	"rain": {
// 		"1h": 0.22
// 	},
  double? oneHour;
  double? threeHour;

  RainData({
    this.oneHour,
    this.threeHour,
  });

  factory RainData.fromJson(Map<String, dynamic> json) => RainData(
        oneHour: json["1h"] ?? 0.0,
        threeHour: json["3h"] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "1h": oneHour,
        "3h": threeHour,
      };

  RainData.empty() {
    oneHour = 0.0;
    threeHour = 0.0;
  }
}
