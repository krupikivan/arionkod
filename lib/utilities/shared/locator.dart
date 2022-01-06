import 'package:arion_code_challenge/providers/citiies_provider.dart';
import 'package:arion_code_challenge/providers/theme_provider.dart';
import 'package:arion_code_challenge/services/api_service.dart';
import 'package:arion_code_challenge/services/cities_service.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

GetIt locator = GetIt.I;

Future<void> setupLocator() async {
  GetIt.I.registerLazySingleton(
    () => ThemeProvider(),
  );
  GetIt.I.registerLazySingleton(
    () => CitiesProvider.init(),
  );
  GetIt.I.registerLazySingleton(
    () => CityNetworkingService(),
  );
  GetIt.I.registerLazySingleton<Dio>(() {
    final dioClient = Dio(
      BaseOptions(
        baseUrl: 'https://api.npoint.io',
        validateStatus: (status) => true,
        headers: {},
      ),
    );

    return dioClient;
  });

  GetIt.I.registerLazySingleton<ApiService>(
    () => ApiService(client: locator()),
  );

  return GetIt.I.allReady();
}
