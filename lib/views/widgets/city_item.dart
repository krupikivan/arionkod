import 'package:arion_code_challenge/models/city.dart';
import 'package:arion_code_challenge/providers/citiies_provider.dart';
import 'package:arion_code_challenge/utilities/shared/locator.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CityItem extends StatelessWidget {
  CityItem({Key? key, required this.city}) : super(key: key);
  final City city;
  final _citiesProvider = locator<CitiesProvider>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _citiesProvider.setCitySelected(city),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedNetworkImage(
              imageUrl: city.image,
              placeholder: (context, imageProvider) => Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(color: Colors.grey),
              ),
              imageBuilder: (context, imageProvider) => Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(city.name),
                  Text(city.city),
                  Text(city.country),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_right_alt,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
