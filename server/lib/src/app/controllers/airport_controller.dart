import 'package:get_it/get_it.dart';
import 'package:shelf/shelf.dart';

import '../usecases/airport/create_airports.dart';
import '../usecases/airport/retrieve_airports.dart';
import '../../utils/custom_error_handler.dart';

class AirportController {
  static final _errorHandler = GetIt.instance<CustomErrorHandler>();

  static Future<Response> createAirports(Request req) async {
    final useCase = CreateAirports(
      errorHandler: _errorHandler,
    );

    return await useCase.execute(req);
  }

  static Future<Response> retrieveAirports(Request req) async {
    final useCase = RetrieveAirports(
      errorHandler: _errorHandler,
    );

    return await useCase.execute(req);
  }
}
