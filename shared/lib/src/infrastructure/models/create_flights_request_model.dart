import 'airlabs/flight_model.dart';

class CreateFlightsRequestModel {
  final List<FlightModel> airlines;

  CreateFlightsRequestModel({
    required this.airlines,
  });

  factory CreateFlightsRequestModel.fromJson(Map<String, dynamic> json) =>
      CreateFlightsRequestModel(
        airlines: List<FlightModel>.from(
          json['flights'].map(
            (json) => FlightModel.fromJson(json),
          ),
        ),
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['flights'] = airlines.map((model) => model.toJson()).toList();
    return json;
  }
}
