import 'package:arion_code_challenge/providers/citiies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../app.dart';

class CityDetailScreen extends StatelessWidget {
  const CityDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const separator = SizedBox(
      height: 20,
    );
    return Consumer<CitiesProvider>(
      builder: (context, value, _) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: value.citySelected?.image ?? '',
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: GestureDetector(
                      onTap: App.navigationKey.currentState!.pop,
                      child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.black54,
                          )),
                    ),
                  )
                ],
              ),
              separator,
              Text(
                value.citySelected!.name,
                style: const TextStyle(fontSize: 30),
              ),
              separator,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  value.citySelected!.description,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
