import 'dart:io';

import 'package:beyond/beyond.dart';

class ExtendedEnv extends Env {
  final String airlabsApiKey;

  ExtendedEnv({
    required this.airlabsApiKey,
    required super.port,
    required super.ip,
    required super.dbService,
    required super.dbHost,
    required super.dbPort,
    required super.dbName,
    required super.dbUsername,
    super.dbPassword,
    required super.secretKey,
  });

  @override
  factory ExtendedEnv.fromJson(Map<dynamic, dynamic> json) => ExtendedEnv(
        airlabsApiKey: json['AIRLABS_API_KEY'],
        port: int.tryParse(json['PORT']) ?? 8080,
        ip: (json['IP'] != null)
            ? InternetAddress(json['IP'])
            : InternetAddress.anyIPv4,
        dbService: json['DB_SERVICE'] ?? 'postgres',
        dbHost: json['DB_HOST'] ?? 'localhost',
        dbPort: int.tryParse(json['DB_PORT']) ?? 5432,
        dbName: json['DB_NAME'] ?? 'database',
        dbUsername: json['DB_USERNAME'] ?? 'root',
        dbPassword: json['DB_PASSWORD'],
        secretKey: json['SECRET_KEY'],
      );

  factory ExtendedEnv.fromEnvironment(Map<dynamic, dynamic> json) =>
      ExtendedEnv(
        airlabsApiKey: json['AIRLABS_API_KEY'],
        port: int.tryParse(json['PORT']) ?? 8080,
        ip: (json['IP'] != null)
            ? InternetAddress(json['IP'])
            : InternetAddress.anyIPv4,
        dbService: json['DB_SERVICE'] ?? 'postgres',
        dbHost: json['DB_HOST'] ?? 'localhost',
        dbPort: int.tryParse(json['DB_PORT']) ?? 5432,
        dbName: json['DB_NAME'] ?? 'database',
        dbUsername: json['DB_USERNAME'] ?? 'root',
        dbPassword: json['DB_PASSWORD'],
        secretKey: json['SECRET_KEY'],
      );
}
