class KeyModel {
  final int id;
  final String apiKey;
  final String type;
  final String expired;
  final String registered;
  final int limitsByHour;
  final int limitsByMinute;
  final int limitsByMonth;
  final int limitsTotal;

  KeyModel({
    required this.id,
    required this.apiKey,
    required this.type,
    required this.expired,
    required this.registered,
    required this.limitsByHour,
    required this.limitsByMinute,
    required this.limitsByMonth,
    required this.limitsTotal,
  });

  factory KeyModel.fromJson(Map<String, dynamic> json) => KeyModel(
        id: json['id'],
        apiKey: json['api_key'],
        type: json['type'],
        expired: json['expired'],
        registered: json['registered'],
        limitsByHour: json['limits_by_hour'],
        limitsByMinute: json['limits_by_minute'],
        limitsByMonth: json['limits_by_month'],
        limitsTotal: json['limits_total'],
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['id'] = id;
    json['api_key'] = apiKey;
    json['type'] = type;
    json['expired'] = expired;
    json['registered'] = registered;
    json['limits_by_hour'] = limitsByHour;
    json['limits_by_minute'] = limitsByMinute;
    json['limits_by_month'] = limitsByMonth;
    json['limits_total'] = limitsTotal;
    return json;
  }
}
