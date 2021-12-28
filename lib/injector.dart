import 'package:app_core/app_core.dart';
import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_base/configs/app_config.dart';
import 'package:flutter_base/configs/backend_config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injector.config.dart';

final injector = GetIt.instance;

@injectableInit
Future<Unit> setupInjector() async {
  await $initGetIt(injector, environment: AppConfig.environment);
  return unit;
}

@module
abstract class MainModule {
  @lazySingleton
  @preResolve
  Future<SharedPreferences> getSharePreferences() => SharedPreferences.getInstance();

  @lazySingleton
  EventBus getEventBus() => EventBus();

  @lazySingleton
  Dio getDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: BackendConfig.baseUrl,
        connectTimeout: BackendConfig.connectTimeout,
        receiveTimeout: BackendConfig.receiveTimeout,
      ),
    );
    // only show log for dev
    if (AppConfig.environment == Environment.dev) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
      );
    }
    return dio;
  }
}
