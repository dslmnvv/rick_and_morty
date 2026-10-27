import 'package:dio/dio.dart';
import 'package:rick_and_morty/app/core/client/network_module.dart';
import 'package:rick_and_morty/routing/app_router.dart';

class AppDependencies {
  const AppDependencies._({required this.dio, required this.router});

  factory AppDependencies.create() {
    return AppDependencies._(
      dio: NetworkModule.createDio(),
      router: AppRouter(),
    );
  }

  final Dio dio;
  final AppRouter router;

  void dispose() {
    dio.close();
    router.dispose();
  }
}
