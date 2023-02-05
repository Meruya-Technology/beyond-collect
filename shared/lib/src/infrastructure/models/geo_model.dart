class GeoModel {
  final String countryCode;
  final String country;
  final String continent;
  final String city;
  final double lat;
  final double lng;
  final String timezone;

  GeoModel({
    required this.countryCode,
    required this.country,
    required this.continent,
    required this.city,
    required this.lat,
    required this.lng,
    required this.timezone,
  });

  factory GeoModel.fromJson(Map<String, dynamic> json) => GeoModel(
        countryCode: json['country_code'],
        country: json['country'],
        continent: json['continent'],
        city: json['city'],
        lat: json['lat'],
        lng: json['lng'],
        timezone: json['timezone'],
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['country_code'] = countryCode;
    json['country'] = country;
    json['continent'] = continent;
    json['city'] = city;
    json['lat'] = lat;
    json['lng'] = lng;
    json['timezone'] = timezone;
    return json;
  }
}
