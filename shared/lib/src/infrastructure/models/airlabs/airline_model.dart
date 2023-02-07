class AirlineModel {
  final String name;
  final String iataCode;
  final String icaoCode;

  AirlineModel({
    required this.name,
    required this.iataCode,
    required this.icaoCode,
  });

  factory AirlineModel.fromJson(Map<String, dynamic> json) => AirlineModel(
        name: json['name'],
        iataCode: json['iata_code'],
        icaoCode: json['icao_code'],
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['name'] = name;
    json['iata_code'] = iataCode;
    json['icao_code'] = icaoCode;
    return json;
  }
}
