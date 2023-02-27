import 'package:beyond/beyond.dart';
import 'package:server/src/app/controllers/airline_controller.dart';
import 'package:server/src/app/controllers/airport_controller.dart';
import 'package:server/src/app/controllers/flight_controller.dart';
import 'package:shelf_router/shelf_router.dart';

/// This class is the main route map to bind every route, into controller
/// also we can add a suffix or global handler, depend on the purposes

class Api extends BaseApi {
  Router get getRoutes => baseRouter
    ..post('/airports', AirportController.createAirports)
    ..get('/airports', AirportController.retrieveAirports)
    ..post('/airlines', AirlineController.createAirlines)
    ..get('/flights/sync', FlightController.syncFlights)
    ..get('/flights', FlightController.retrieveFlights);
}
