import 'geo_model.dart';
import 'connection_model.dart';
import 'karma_model.dart';
 
 class ClientModel {	final String ip;
	final GeoModel geo;
	final ConnectionModel connection;
	final Null device;
	final Null agent;
	final KarmaModel karma;
 
 ClientModel({		required this.ip,		required this.geo,		required this.connection,		required this.device,		required this.agent,		required this.karma,}); 

 factory ClientModel.fromJson(
          Map<String, dynamic> json) => ClientModel(ip : json['ip'],geo : GeoModel.fromJson(json),connection : ConnectionModel.fromJson(json),device : json['device'],agent : json['agent'],karma : KarmaModel.fromJson(json),); 

 Map<String, dynamic> toJson() {
      final json = <String, dynamic>{}; json['ip'] = ip;json['geo'] = geo.toJson();json['connection'] = connection.toJson();json['device'] = device;json['agent'] = agent;json['karma'] = karma.toJson(); return json;}}