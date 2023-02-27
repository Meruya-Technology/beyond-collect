import 'package:beyond/beyond.dart';
import 'package:get_it/get_it.dart';
import 'package:postgres/postgres.dart';
import 'package:shelf/shelf.dart';

class RetrieveFlights extends UseCase<Request, Response> {
  final ErrorHandler errorHandler;

  RetrieveFlights({
    required this.errorHandler,
  });

  PostgreSQLConnection get _database => GetIt.instance<PostgreSQLConnection>();

  @override
  Future<Response> build(Request data) async {
    final flights = await _database.mappedResultsQuery('''
    SELECT * FROM flights
    WHERE created_at = (SELECT DISTINCT ON (created_at) created_at FROM flights
    ORDER BY created_at DESC limit 1)
    ORDER BY updated DESC 
    ''');

    final newResults = flights.map((result) => result['flights']).toList();

    final convertedResult = newResults.map(
      (newResult) => newResult?.map(
        (key, value) => MapEntry(
          key,
          (value is DateTime) ? value.toIso8601String() : value,
        ),
      ),
    );

    return JsonResponse(
      200,
      body: {
        'message': 'Success retrieve flights data',
        'data': convertedResult.toList(),
      },
    );
  }

  @override
  Future<Response> handleError(error) async => errorHandler.formatError(error);
}
