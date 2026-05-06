class CountryCodeModel {
  final int id;
  final String countryName;
  final String countryCode;
  final String isoCode;

  CountryCodeModel({
    required this.id,
    required this.countryName,
    required this.countryCode,
    required this.isoCode,
  });

  factory CountryCodeModel.fromJson(Map<String, dynamic>? json) {
    return CountryCodeModel(
      id: json?['id'] ?? 0,
      countryName: json?['country_name'] ?? '',
      countryCode: json?['country_code'] ?? '',
      isoCode: json?['iso_code'] ?? '',
    );
  }
}
