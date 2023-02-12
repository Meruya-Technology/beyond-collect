import 'request_model.dart';
import 'airport_model.dart';

class AirportsResponseModel {
  final RequestModel request;
  final List<AirportModel> response;
  final String terms;

  AirportsResponseModel({
    required this.request,
    required this.response,
    required this.terms,
  });

  factory AirportsResponseModel.fromJson(Map<String, dynamic> json) =>
      AirportsResponseModel(
        request: RequestModel.fromJson(json),
        response: List<AirportModel>.from(
          json['response'].map(
            (json) => AirportModel.fromJson(json),
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
