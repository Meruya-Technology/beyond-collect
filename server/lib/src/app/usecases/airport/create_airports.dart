import 'dart:convert';

import 'package:beyond/beyond.dart';
import 'package:get_it/get_it.dart';
import 'package:shared/shared.dart';
import 'package:shelf/shelf.dart';

import '../../../utils/postgresql.dart';

class CreateAirports extends UseCase<Request, Response> {
  final ErrorHandler errorHandler;

  CreateAirports({
    required this.errorHandler,
  });

  final database = Postgresql.credential;

  @override
  Future<Response> build(Request data) async {
    final requestBody = jsonDecode(
      await data.readAsString(),
    );
    print(requestBody);
    final request = CreateAirportsRequestModel.fromJson(
      requestBody,
    );
    print('here');

    final result = await DB<List<AirportModel>>(
      model: request.airports,
    ).create();

    return JsonResponse(
      200,
      body: {
        'message': 'new success',
        'result': result,
      },
    );
  }

  @override
  Future<Response> handleError(error) async => errorHandler.formatError(error);
}
