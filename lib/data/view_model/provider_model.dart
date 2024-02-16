import 'package:flutter/material.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/services/weather_api.dart';

class ProviderModel extends ChangeNotifier {
  List<WeatherModel> data = [];
  Future getData() async {
    final info = await WeatherApi().getWeatherData();
    data.add(info);
    notifyListeners();
  }
}
