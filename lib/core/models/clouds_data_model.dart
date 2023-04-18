class CloudsData {
  // 	"clouds": {
  // 		"all": 15
  // 	},

  int? all;
  CloudsData({this.all});
  factory CloudsData.fromJson(Map<String, dynamic> json) => CloudsData(
        all: json['all'] ?? 0,
      );
  Map<String, dynamic> toJson() => {
        'all': all,
      };

  CloudsData.empty() {
    all = 0;
  }
}
