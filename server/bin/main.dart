import 'package:args/args.dart';
import 'package:beyond/beyond.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:server/src/common/extended_env.dart';
import 'package:server/src/utils/dio_interceptor.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';

import 'package:server/src/app/api.dart';
import 'package:server/src/app/http.dart';
import 'package:server/src/utils/custom_error_handler.dart';
import 'package:server/src/utils/database_util.dart';

void main(List<String> args) async {
  /// Dependency injector instance
  final getIt = GetIt.instance;

  /// Parse .env file into active env class
  final env = ExtendedEnv.fromJson(
    await EnvUtil.readEnv(),
  );

  /// Initialize database util
  final database = DatabaseUtil();

  /// Initialize global error handler
  final errorHandler = CustomErrorHandler();

  /// Initialize http client
  final dioClient = Dio()
    ..interceptors.add(
      DioInterceptor(
        logIsAllowed: true,
      ),
    );

  /// Initialize Api, and handlers
  final api = Api();

  /// Initialize pipeline handler & middleware
  final http = Http(
    [logRequests()],
    api,
  );

  /// Inject dependencies sequences :
  /// 1. Env
  /// 2. Error handler
  getIt.registerSingleton<ExtendedEnv>(env);

  getIt.registerSingleton<CustomErrorHandler>(errorHandler);

  getIt.registerSingleton<Dio>(dioClient);

  /// Open database connection
  final postgresql = await database.openConnection();

  DB.initialize(postgresql);

  /// Serve handler

  withHotreload(
    () async {
      final server = await serve(
        http.handler,
        env.ip,
        env.port,
        poweredByHeader: 'Beyond dart',
      );

      print('Beyond server active, listening on port ${server.port}');
      return server;
    },
  );
}
