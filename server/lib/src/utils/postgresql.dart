import 'package:get_it/get_it.dart';
import 'package:postgres/postgres.dart';

import '../common/extended_env.dart';

class Postgresql {
  static final _env = GetIt.instance<ExtendedEnv>();

  static PostgreSQLConnection get credential => PostgreSQLConnection(
        _env.dbHost,
        _env.dbPort,
        _env.dbName,
        username: _env.dbUsername,
        password: _env.dbPassword,
      );
}
