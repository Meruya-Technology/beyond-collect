import 'request_model.dart';
import 'airline_model.dart';

class AirlinesResponseModel {
  final RequestModel request;
  final List<AirlineModel> response;
  final String terms;

  AirlinesResponseModel({
    required this.request,
    required this.response,
    required this.terms,
  });

  factory AirlinesResponseModel.fromJson(Map<String, dynamic> json) =>
      AirlinesResponseModel(
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
