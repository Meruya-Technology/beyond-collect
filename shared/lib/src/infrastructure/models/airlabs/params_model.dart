class ParamsModel {
  final String? iataCode;
  final String? lang;

  ParamsModel({
    this.iataCode,
    this.lang,
  });

  factory ParamsModel.fromJson(Map<String, dynamic> json) => ParamsModel(
        iataCode: json['iata_code'],
        lang: json['lang'],
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['iata_code'] = iataCode;
    json['lang'] = lang;
    return json;
  }
}
