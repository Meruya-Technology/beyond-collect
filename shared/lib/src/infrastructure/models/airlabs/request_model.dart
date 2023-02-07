import 'key_model.dart';
import 'params_model.dart';
import 'client_model.dart';

class RequestModel {
  final String lang;
  final String currency;
  final int time;
  final String id;
  final String server;
  final String host;
  final int pid;
  final KeyModel key;
  final ParamsModel params;
  final int version;
  final String method;
  final ClientModel client;

  RequestModel({
    required this.lang,
    required this.currency,
    required this.time,
    required this.id,
    required this.server,
    required this.host,
    required this.pid,
    required this.key,
    required this.params,
    required this.version,
    required this.method,
    required this.client,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        lang: json['lang'],
        currency: json['currency'],
        time: json['time'],
        id: json['id'],
        server: json['server'],
        host: json['host'],
        pid: json['pid'],
        key: KeyModel.fromJson(json),
        params: ParamsModel.fromJson(json),
        version: json['version'],
        method: json['method'],
        client: ClientModel.fromJson(json),
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['lang'] = lang;
    json['currency'] = currency;
    json['time'] = time;
    json['id'] = id;
    json['server'] = server;
    json['host'] = host;
    json['pid'] = pid;
    json['key'] = key.toJson();
    json['params'] = params.toJson();
    json['version'] = version;
    json['method'] = method;
    json['client'] = client.toJson();
    return json;
  }
}
