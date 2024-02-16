import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/services/weather_api.dart';

import '../data/view_model/provider_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApi weatherApi = WeatherApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 10, 1, 28),
              Color.fromARGB(255, 144, 94, 224)
            ],
          ),
        ),
        child: Consumer<ProviderModel>(
          builder: (context, value, child) {
            if (value.data.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (value.data.isNotEmpty) {
              return Text(value.data[0].location.name);
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<WeatherModel>().getWeatherData();
      }),
    );
  }
}
