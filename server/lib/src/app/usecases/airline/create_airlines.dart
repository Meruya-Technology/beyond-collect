import 'dart:convert';

import 'package:beyond/beyond.dart';
import 'package:shared/shared.dart';
import 'package:shelf/shelf.dart';

import '../../../utils/postgresql.dart';

class CreateAirlines extends UseCase<Request, Response> {
  final ErrorHandler errorHandler;

  CreateAirlines({
    required this.errorHandler,
  });

  final database = Postgresql.credential;

  @override
  Future<Response> build(Request data) async {
    final requestBody = jsonDecode(
      await data.readAsString(),
    );
    final request = CreateAirlinesRequestModel.fromJson(
      requestBody,
    );

    final result = await DB<List<AirlineModel>>(
      model: request.airlines,
    ).create();

    return JsonResponse(
      200,
      body: {
        'message': '$result Airlines data inserted successfully',
      },
    );
  }

  @override
  Future<Response> handleError(error) async => errorHandler.formatError(error);
}
