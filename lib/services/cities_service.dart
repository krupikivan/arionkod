import 'package:arion_code_challenge/models/city.dart';
import 'package:arion_code_challenge/utilities/shared/locator.dart';

import 'api_service.dart';

class CityNetworkingService {
  static const getCitiesPath = '/5ecaa20ebea4d86084e5';

  final _apiService = locator<ApiService>();

  Future<List<City>> fetchCities() async {
    final response = await _apiService.get(
      path: getCitiesPath,
    );
    return (response as List).map((e) => City.fromJson(e)).toList();
  }
}
