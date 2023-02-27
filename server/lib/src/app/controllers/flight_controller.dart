import 'package:dio/dio.dart' hide Response;
import 'package:get_it/get_it.dart';
import 'package:server/src/app/usecases/flight/retrieve_flights.dart';
import 'package:shelf/shelf.dart';

import '../usecases/flight/sync_flights.dart';
import '../../utils/custom_error_handler.dart';

class FlightController {
  static final _errorHandler = GetIt.instance<CustomErrorHandler>();
  static final _dioClient = GetIt.instance<Dio>();

  static Future<Response> syncFlights(Request req) async {
    final useCase = SyncFlights(
      errorHandler: _errorHandler,
      dioClient: _dioClient,
    );

    return await useCase.execute(req);
  }

  static Future<Response> retrieveFlights(Request req) async {
    final useCase = RetrieveFlights(
      errorHandler: _errorHandler,
    );

    return await useCase.execute(req);
  }
}
