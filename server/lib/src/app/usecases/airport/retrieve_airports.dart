import 'dart:convert';

import 'package:beyond/beyond.dart';
import 'package:shared/shared.dart';
import 'package:shelf/shelf.dart';

class RetrieveAirports extends UseCase<Request, Response> {
  final ErrorHandler errorHandler;

  RetrieveAirports({
    required this.errorHandler,
  });

  @override
  Future<Response> build(Request data) async {
    final requestBody = jsonDecode(
      await data.readAsString(),
    );
    final request = RetrieveAirportsRequestModel.fromJson(
      requestBody,
    );

    final airports = await DB<AirportModel>().select(
      conditions: [
        Condition(
          field: 'name',
          value: request.name,
        ),
        Condition(
          field: 'icao_code',
          value: request.icaoCode,
        ),
        Condition(
          field: 'iata_code',
          value: request.iataCode,
        ),
        Condition(
          field: 'country_code',
          value: request.countryCode,
        )
      ],
    );

    return JsonResponse(
      200,
      body: {
        'message': 'Success retrieve airports data',
        'data': airports,
      },
    );
  }

  @override
  Future<Response> handleError(error) async => errorHandler.formatError(error);
}
