class CapitalEntity {
  final String? capital;
  final String? region;
  final String? countryName;
  final List<dynamic>? latlng;
  final String? cca2;

  CapitalEntity(
      {this.capital, this.region, this.countryName, this.latlng, this.cca2});

  CapitalEntity.empty({
    this.capital = '',
    this.region = '',
    this.countryName = '',
    this.latlng = const [],
    this.cca2 = '',
  });
}
