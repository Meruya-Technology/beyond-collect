import 'package:get_it/get_it.dart';
import 'package:server/src/app/usecases/airline/create_airlines.dart';
import 'package:shelf/shelf.dart';

import '../../utils/custom_error_handler.dart';

class AirlineController {
  static final _errorHandler = GetIt.instance<CustomErrorHandler>();

  static Future<Response> createAirlines(Request req) async {
    final useCase = CreateAirlines(
      errorHandler: _errorHandler,
    );

    return await useCase.execute(req);
  }
}
