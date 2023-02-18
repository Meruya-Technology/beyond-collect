import 'package:beyond/beyond.dart';

@Table(
  name: 'flight_histories',
)
class FlightHistoryModel {
  @Field(isFillable: false)
  final int? id;

  @Field(isFillable: false)
  final String? createdAt;
  final int? rows;

  FlightHistoryModel({
    this.id,
    this.createdAt,
    required this.rows,
  });

  factory FlightHistoryModel.fromJson(Map<String, dynamic> json) =>
      FlightHistoryModel(
        id: json['id'],
        createdAt: json['created_at'],
        rows: json['rows'],
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['id'] = id;
    json['created_at'] = createdAt;
    json['rows'] = rows;
    return json;
  }
}
