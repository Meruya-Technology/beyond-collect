import 'package:get_it/get_it.dart';
import 'package:server/src/app/usecases/airport/create_airports.dart';
import 'package:shelf/shelf.dart';

import '../../utils/custom_error_handler.dart';

class AirportController {
  static final _errorHandler = GetIt.instance<CustomErrorHandler>();

  static Future<Response> createAirports(Request req) async {
    final useCase = CreateAirports(
      errorHandler: _errorHandler,
    );

    return await useCase.execute(req);
  }
}
