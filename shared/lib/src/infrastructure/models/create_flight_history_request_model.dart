class CreateFlightHistoryRequestModel {
  final int rows;

  CreateFlightHistoryRequestModel({
    required this.rows,
  });

  factory CreateFlightHistoryRequestModel.fromJson(Map<String, dynamic> json) =>
      CreateFlightHistoryRequestModel(
        rows: json['rows'],
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['rows'] = rows;
    return json;
  }
}
