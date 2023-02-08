import 'package:beyond/beyond.dart' hide DataUtil;

import '../../../utils/data_util.dart';

/// Table meta data, name, schema
@Table(
  name: 'airports',
)
class AirportModel {
  final String name;
  final String? iataCode;
  final String? icaoCode;
  final double lat;
  final double lng;
  final double? alt;
  final String? city;
  final String? cityCode;
  final String? unLocode;
  final String? timezone;
  final String countryCode;
  final dynamic names;
  final int? runways;
  final int? departures;
  final bool? isMajor;
  final int? isInternational;
  final String? website;
  final String? facebook;
  final String? twitter;
  final String? instagram;
  final String? linkedin;
  final String? slug;

  AirportModel({
    required this.name,
    this.iataCode,
    this.icaoCode,
    required this.lat,
    required this.lng,
    this.alt,
    this.city,
    this.cityCode,
    this.unLocode,
    this.timezone,
    required this.countryCode,
    this.names,
    this.runways,
    this.departures,
    this.isMajor,
    this.isInternational,
    this.website,
    this.facebook,
    this.twitter,
    this.instagram,
    this.linkedin,
    this.slug,
  });

  factory AirportModel.fromJson(Map<String, dynamic> json) => AirportModel(
        name: json['name'],
        iataCode: json['iata_code'],
        icaoCode: json['icao_code'],
        lat: DataUtil.mapNumberToDouble(
          json['lat'],
        ),
        lng: DataUtil.mapNumberToDouble(
          json['lng'],
        ),
        alt: DataUtil.mapNullableNumberToDouble(
          json['alt'],
        ),
        city: json['city'],
        cityCode: json['city_code'],
        unLocode: json['un_lucode'],
        timezone: json['timezone'],
        countryCode: json['country_code'],
        names: json['names'],
        runways: json['runways'],
        departures: json['departures'],
        isMajor: json['is_major'],
        isInternational: json['is_international'],
        website: json['website'],
        facebook: json['facebook'],
        twitter: json['twitter'],
        instagram: json['instagram'],
        linkedin: json['linkedin'],
        slug: json['slug'],
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['name'] = name;
    json['iata_code'] = iataCode;
    json['icao_code'] = icaoCode;
    json['lat'] = lat;
    json['lng'] = lng;
    json['alt'] = alt;
    json['city'] = city;
    json['city_code'] = cityCode;
    json['un_lucode'] = unLocode;
    json['timezone'] = timezone;
    json['country_code'] = countryCode;
    json['names'] = names;
    json['runways'] = runways;
    json['departures'] = departures;
    json['is_major'] = isMajor;
    json['is_international'] = isInternational;
    json['website'] = website;
    json['facebook'] = facebook;
    json['twitter'] = twitter;
    json['instagram'] = instagram;
    json['linkedin'] = linkedin;
    json['slug'] = slug;
    return json;
  }
}
