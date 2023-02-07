import 'request_model.dart';
import 'airline_model.dart';

class AirlineResponseModel {
  final RequestModel request;
  final List<AirlineModel> response;
  final String terms;

  AirlineResponseModel({
    required this.request,
    required this.response,
    required this.terms,
  });

  factory AirlineResponseModel.fromJson(Map<String, dynamic> json) =>
      AirlineResponseModel(
        request: RequestModel.fromJson(json),
        response: List<AirlineModel>.from(
          json['response'].map(
            (json) => AirlineModel.fromJson(json['response']),
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
