import 'package:shared/src/infrastructure/models/airlabs/flight_model.dart';

import 'request_model.dart';

class FlightsResponseModel {
  final RequestModel request;
  final List<FlightModel> response;
  final String terms;

  FlightsResponseModel({
    required this.request,
    required this.response,
    required this.terms,
  });

  factory FlightsResponseModel.fromJson(Map<String, dynamic> json) =>
      FlightsResponseModel(
        request: RequestModel.fromJson(json),
        response: List<FlightModel>.from(
          json['response'].map(
            (json) => FlightModel.fromJson(json['response']),
          ),
        ),
        terms: json['terms'],
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['request'] = request.toJson();
    json['response'] = response.map((model) => model.toJson()).toList();
    json['terms'] = terms;
    return json;
  }
}
