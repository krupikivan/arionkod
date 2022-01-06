import 'package:arion_code_challenge/models/city.dart';
import 'package:arion_code_challenge/services/cities_service.dart';
import 'package:arion_code_challenge/utilities/shared/locator.dart';
import 'package:arion_code_challenge/utilities/shared/route_names.dart';
import 'package:flutter/material.dart';

import '../app.dart';

enum StatusRequest { loading, error, success, none }

class CitiesProvider extends ChangeNotifier {
  CitiesProvider.init() {
    fetchCities();
  }

  final _cityNetworkingService = locator<CityNetworkingService>();

  StatusRequest _statusRequest = StatusRequest.none;

  final List<City> _cities = [];
  final List<City> _filtered = [];
  City? _citySelected;

  List<City> get cities => _cities;
  List<City> get filtered => _filtered;
  City? get citySelected => _citySelected;

  StatusRequest get statusRequest => _statusRequest;

  Future<void> fetchCities() async {
    _statusRequest = StatusRequest.loading;
    notifyListeners();
    final list = await _cityNetworkingService.fetchCities();
    _cities.addAll(list);
    _filtered.addAll(list);
    _statusRequest = StatusRequest.success;
    notifyListeners();
  }

  setFilterList(String filter) {
    List<City> filtered = [];
    filtered = _cities
        .where((e) =>
            e.name.toLowerCase().contains(filter.toLowerCase()) ||
            e.city.toLowerCase().contains(filter.toLowerCase()) ||
            e.country.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    _filtered.clear();
    _filtered.addAll(filtered);
    notifyListeners();
  }

  setCitySelected(City value) {
    _citySelected = value;
    notifyListeners();
    App.navigationKey.currentState!.pushNamed(cityDetailRoute);
  }
}
