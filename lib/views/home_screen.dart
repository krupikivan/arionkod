import 'package:arion_code_challenge/providers/citiies_provider.dart';
import 'package:arion_code_challenge/providers/theme_provider.dart';
import 'package:arion_code_challenge/utilities/shared/locator.dart';
import 'package:arion_code_challenge/views/widgets/city_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _citiesProvider = locator<CitiesProvider>();
  final _themeProvider = locator<ThemeProvider>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _themeProvider.setDarkMode,
        label: const Text('Change Theme'),
      ),
      body: RefreshIndicator(
        onRefresh: _citiesProvider.fetchCities,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: 'Search',
                    contentPadding: EdgeInsets.only(left: 16)),
                onChanged: _citiesProvider.setFilterList,
              ),
            ),
            Consumer<CitiesProvider>(
              builder: (context, value, _) =>
                  value.statusRequest == StatusRequest.loading
                      ? _loadingWidget()
                      : Expanded(
                          child: ListView(
                            children: value.filtered
                                .map((e) => CityItem(
                                      city: e,
                                    ))
                                .toList(),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
