import 'package:beyond/beyond.dart';
import 'package:shelf/shelf.dart';

class CustomErrorHandler implements ErrorHandler {
  @override
  Future<Response> formatError(dynamic error) async {
    print(error.toString());
    return Response(
      500,
      body: BaseMessages.internalServerError,
    );
  }
}
