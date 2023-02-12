class FlightModel {
  final String hex;
  final String regNumber;
  final String flag;
  final double lat;
  final double lng;
  final int alt;
  final int dir;
  final int speed;
  final double vSpeed;
  final String squawk;
  final String flightNumber;
  final String flightIcao;
  final String flightIata;
  final String depIcao;
  final String depIata;
  final String arrIcao;
  final String arrIata;
  final String airlineIcao;
  final String airlineIata;
  final String aircraftIcao;
  final int updated;
  final String status;

  FlightModel({
    required this.hex,
    required this.regNumber,
    required this.flag,
    required this.lat,
    required this.lng,
    required this.alt,
    required this.dir,
    required this.speed,
    required this.vSpeed,
    required this.squawk,
    required this.flightNumber,
    required this.flightIcao,
    required this.flightIata,
    required this.depIcao,
    required this.depIata,
    required this.arrIcao,
    required this.arrIata,
    required this.airlineIcao,
    required this.airlineIata,
    required this.aircraftIcao,
    required this.updated,
    required this.status,
  });

  factory FlightModel.fromJson(Map<String, dynamic> json) => FlightModel(
        hex: json['hex'],
        regNumber: json['reg_number'],
        flag: json['flag'],
        lat: json['lat'],
        lng: json['lng'],
        alt: json['alt'],
        dir: json['dir'],
        speed: json['speed'],
        vSpeed: json['v_speed'],
        squawk: json['squawk'],
        flightNumber: json['flight_number'],
        flightIcao: json['flight_icao'],
        flightIata: json['flight_iata'],
        depIcao: json['dep_icao'],
        depIata: json['dep_iata'],
        arrIcao: json['arr_icao'],
        arrIata: json['arr_iata'],
        airlineIcao: json['airline_icao'],
        airlineIata: json['airline_iata'],
        aircraftIcao: json['aircraft_icao'],
        updated: json['updated'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['hex'] = hex;
    json['reg_number'] = regNumber;
    json['flag'] = flag;
    json['lat'] = lat;
    json['lng'] = lng;
    json['alt'] = alt;
    json['dir'] = dir;
    json['speed'] = speed;
    json['v_speed'] = vSpeed;
    json['squawk'] = squawk;
    json['flight_number'] = flightNumber;
    json['flight_icao'] = flightIcao;
    json['flight_iata'] = flightIata;
    json['dep_icao'] = depIcao;
    json['dep_iata'] = depIata;
    json['arr_icao'] = arrIcao;
    json['arr_iata'] = arrIata;
    json['airline_icao'] = airlineIcao;
    json['airline_iata'] = airlineIata;
    json['aircraft_icao'] = aircraftIcao;
    json['updated'] = updated;
    json['status'] = status;
    return json;
  }
}
