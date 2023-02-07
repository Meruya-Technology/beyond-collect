import 'airlabs/airline_model.dart';

class CreateAirlinesRequestModel {
  final List<AirlineModel> airlines;

  CreateAirlinesRequestModel({
    required this.airlines,
  });

  factory CreateAirlinesRequestModel.fromJson(Map<String, dynamic> json) =>
      CreateAirlinesRequestModel(
        airlines: List<AirlineModel>.from(
          json['airlines'].map(
            (json) => AirlineModel.fromJson(json),
          ),
        ),
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['airlines'] = airlines.map((model) => model.toJson()).toList();
    return json;
  }
}
