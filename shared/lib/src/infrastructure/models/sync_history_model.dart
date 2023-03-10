import 'package:beyond/beyond.dart';

@Table(
  name: 'sync_histories',
)
class SyncHistoryModel {
  @Field(isFillable: false)
  final int? id;

  @Field(isFillable: false)
  final String? createdAt;
  final int? rows;
  final double? duration;
  final double? size;
  final String type;

  SyncHistoryModel({
    this.id,
    this.createdAt,
    required this.rows,
    this.duration = 0.0,
    this.size = 0.0,
    required this.type,
  });

  factory SyncHistoryModel.fromJson(Map<String, dynamic> json) =>
      SyncHistoryModel(
        id: json['id'],
        createdAt: json['created_at'],
        rows: json['rows'],
        duration: json['duration'],
        size: json['size'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['id'] = id;
    json['created_at'] = createdAt;
    json['rows'] = rows;
    json['duration'] = duration;
    json['size'] = size;
    json['type'] = type;
    return json;
  }
}
