class CapitalEntity {
  final String? capital;
  final String? region;
  final String? countryName;
  final List<dynamic>? latlng;

  CapitalEntity({this.capital, this.region, this.countryName, this.latlng});

  CapitalEntity.empty({
    this.capital = '',
    this.region = '',
    this.countryName = '',
    this.latlng = const [],
  });
}
