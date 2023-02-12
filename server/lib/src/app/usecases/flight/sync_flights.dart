import 'package:beyond/beyond.dart';
import 'package:dio/dio.dart' hide Response;
import 'package:get_it/get_it.dart';
import 'package:server/src/common/endpoint.dart';
import 'package:shared/shared.dart';
import 'package:shelf/shelf.dart';

import '../../../common/extended_env.dart';
import '../../../utils/postgresql.dart';

class SyncFlights extends UseCase<Request, Response> {
  final ErrorHandler errorHandler;
  final Dio dioClient;

  SyncFlights({
    required this.errorHandler,
    required this.dioClient,
  });

  static final _env = GetIt.instance<ExtendedEnv>();
  final database = Postgresql.credential;

  @override
  Future<Response> build(Request data) async {
    final flights = await dioClient.get(
      'https://airlabs.co/${Endpoint.retrieveFlights}',
      options: Options(
        headers: {
          Headers.contentTypeHeader: Headers.formUrlEncodedContentType,
        },
      ),
      queryParameters: {
        'api_key': _env.airlabsApiKey,
      },
    );

    if (flights.data == null) {
      return JsonResponse(
        500,
        body: {
          'message': 'Unable to synchronize flights data',
        },
      );
    }

    final flgihtsResponseModel = FlightsResponseModel.fromJson(
      flights.data,
    );

    if (flgihtsResponseModel.response.isEmpty) {
      return JsonResponse(
        204,
        body: {
          'message': 'Proccess done without syncronize data',
        },
      );
    }

    final result = await DB<List<FlightModel>>(
      model: flgihtsResponseModel.response,
    ).create();

    return JsonResponse(
      200,
      body: {
        'message': '$result flight data synchronized',
      },
    );
  }

  @override
  Future<Response> handleError(error) async => errorHandler.formatError(error);
}
