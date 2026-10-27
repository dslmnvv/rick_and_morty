import 'package:dio/dio.dart';
import 'package:rick_and_morty/app/core/const/app_const.dart';

abstract final class NetworkModule {
  static Dio createDio() {
    return Dio(
      BaseOptions(
        baseUrl: AppConst.baseUrl,
        connectTimeout: AppConst.requestTimeout,
        receiveTimeout: AppConst.requestTimeout,
      ),
    );
  }
}
