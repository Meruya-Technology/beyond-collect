import 'package:beyond/beyond.dart';

@Table(
  name: 'airlines',
)
class AirlineModel {
  final String name;
  final String? iataPrefix;
  final String? iataAccounting;
  final String? iataCode;
  final String? icaoCode;
  final String? callsign;
  final String? countryCode;
  final int? iosaRegistered;
  final int? isScheduled;
  final int? isPassenger;
  final int? isCargo;
  final int? isInternational;
  final int? totalAircrafts;
  final int? averageFleetAge;

  @Field(field: 'accidents_last_5y')
  final int? accidentsLast5y;

  @Field(field: 'crashes_last_5y')
  final int? crashesLast5y;

  final String? website;
  final String? facebook;
  final String? twitter;
  final String? instagram;
  final String? linkedin;
  final String? slug;

  AirlineModel({
    required this.name,
    this.iataPrefix,
    this.iataAccounting,
    this.iataCode,
    this.icaoCode,
    this.callsign,
    this.countryCode,
    //
    this.iosaRegistered,
    this.isScheduled,
    this.isPassenger,
    this.isCargo,
    this.isInternational,
    this.totalAircrafts,
    this.averageFleetAge,
    this.accidentsLast5y,
    this.crashesLast5y,
    this.website,
    this.facebook,
    this.twitter,
    this.instagram,
    this.linkedin,
    this.slug,
  });

  factory AirlineModel.fromJson(Map<String, dynamic> json) => AirlineModel(
        name: json['name'],
        iataPrefix: json['iata_prefix'],
        iataAccounting: json['iata_accounting'],
        iataCode: json['iata_code'],
        icaoCode: json['icao_code'],
        callsign: json['callsign'],
        countryCode: json['country_code'],
        //
        iosaRegistered: json['iosa_registered'],
        isScheduled: json['is_scheduled'],
        isPassenger: json['is_passenger'],
        isCargo: json['is_cargo'],
        isInternational: json['is_international'],
        totalAircrafts: json['total_aircrafts'],
        averageFleetAge: json['average_fleet_age'],
        accidentsLast5y: json['accidents_last_5y'],
        crashesLast5y: json['crashes_last_5y'],
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
    json['iata_prefix'] = iataPrefix;
    json['iata_accounting'] = iataAccounting;
    json['icao_code'] = icaoCode;
    json['callsign'] = callsign;
    json['country_code'] = countryCode;
    json['iosa_registered'] = iosaRegistered;
    json['is_scheduled'] = isScheduled;
    json['is_passenger'] = isPassenger;
    json['is_cargo'] = isCargo;
    json['is_international'] = isInternational;
    json['total_aircrafts'] = totalAircrafts;
    json['average_fleet_age'] = averageFleetAge;
    json['accidents_last_5y'] = accidentsLast5y;
    json['crashes_last_5y'] = crashesLast5y;
    //
    json['website'] = website;
    json['facebook'] = facebook;
    json['twitter'] = twitter;
    json['instagram'] = instagram;
    json['linkedin'] = linkedin;
    json['slug'] = slug;
    return json;
  }
}
