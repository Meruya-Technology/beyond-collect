class FleetModel {
  final String hex;
  final String regNumber;
  final String flag;
  final String airlineIcao;
  final String airlineIata;
  final int seen;
  final String? icao;
  final String? iata;
  final String model;
  final String engine;
  final String engineCount;
  final String? manufacturer;
  final String type;
  final String category;
  final int built;
  final int age;
  final String msn;
  final String line;

  FleetModel({
    required this.hex,
    required this.regNumber,
    required this.flag,
    required this.airlineIcao,
    required this.airlineIata,
    required this.seen,
    this.icao,
    this.iata,
    required this.model,
    required this.engine,
    required this.engineCount,
    this.manufacturer,
    required this.type,
    required this.category,
    required this.built,
    required this.age,
    required this.msn,
    required this.line,
  });

  factory FleetModel.fromJson(Map<String, dynamic> json) => FleetModel(
        hex: json['hex'],
        regNumber: json['reg_number'],
        flag: json['flag'],
        airlineIcao: json['airline_icao'],
        airlineIata: json['airline_iata'],
        seen: json['seen'],
        icao: json['icao'],
        iata: json['iata'],
        model: json['model'],
        engine: json['engine'],
        engineCount: json['engine_count'],
        manufacturer: json['manufacturer'],
        type: json['type'],
        category: json['category'],
        built: json['built'],
        age: json['age'],
        msn: json['msn'],
        line: json['line'],
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['hex'] = hex;
    json['reg_number'] = regNumber;
    json['flag'] = flag;
    json['airline_icao'] = airlineIcao;
    json['airline_iata'] = airlineIata;
    json['seen'] = seen;
    json['icao'] = icao;
    json['iata'] = iata;
    json['model'] = model;
    json['engine'] = engine;
    json['engine_count'] = engineCount;
    json['manufacturer'] = manufacturer;
    json['type'] = type;
    json['category'] = category;
    json['built'] = built;
    json['age'] = age;
    json['msn'] = msn;
    json['line'] = line;
    return json;
  }
}
