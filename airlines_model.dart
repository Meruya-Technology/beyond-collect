import 'request_model.dart';
import 'response_model.dart';

class AirlinesModel {
  final RequestModel request;
  final List<ResponseModel> response;
  final String terms;

  AirlinesModel({
    required this.request,
    required this.response,
    required this.terms,
  });

  factory AirlinesModel.fromJson(Map<String, dynamic> json) => AirlinesModel(
        request: RequestModel.fromJson(json),
        response: List<ResponseModel>.from(
          json['response'].map(
            (json) => ResponseModel.fromJson(json['response']),
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
