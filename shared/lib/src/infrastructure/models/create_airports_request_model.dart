import 'package:beyond/beyond.dart';

import 'airlabs/airport_model.dart';

/// Table meta data, name, schema
@Table(
  name: 'airport',
)
class CreateAirportsRequestModel {
  final List<AirportModel> airports;

  CreateAirportsRequestModel({
    required this.airports,
  });

  factory CreateAirportsRequestModel.fromJson(Map<String, dynamic> json) =>
      CreateAirportsRequestModel(
        airports: List<AirportModel>.from(
          json['airports'].map(
            (json) => AirportModel.fromJson(json),
          ),
        ),
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['airports'] = airports.map((model) => model.toJson()).toList();
    return json;
  }
}
