class RetrieveAirportsRequestModel {
  final String? name;
  final String? iataCode;
  final String? icaoCode;
  final String? countryCode;

  RetrieveAirportsRequestModel({
    this.name,
    this.iataCode,
    this.icaoCode,
    this.countryCode,
  });

  factory RetrieveAirportsRequestModel.fromJson(Map<String, dynamic> json) =>
      RetrieveAirportsRequestModel(
        name: json['name'],
        iataCode: json['iataCode'],
        icaoCode: json['icaoCode'],
        countryCode: json['countryCode'],
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['name'] = name;
    json['iataCode'] = iataCode;
    json['icaoCode'] = icaoCode;
    json['countryCode'] = countryCode;
    return json;
  }
}
