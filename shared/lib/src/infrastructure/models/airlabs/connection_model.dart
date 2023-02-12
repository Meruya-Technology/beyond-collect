class ConnectionModel {
  final String? type;
  final int? ispCode;
  final String? ispName;

  ConnectionModel({
    this.type,
    this.ispCode,
    this.ispName,
  });

  factory ConnectionModel.fromJson(Map<String, dynamic> json) =>
      ConnectionModel(
        type: json['type'],
        ispCode: json['isp_code'],
        ispName: json['isp_name'],
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['type'] = type;
    json['isp_code'] = ispCode;
    json['isp_name'] = ispName;
    return json;
  }
}
