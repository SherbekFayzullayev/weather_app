class WeatherModel {
  Location location;
  Current current;
  WeatherModel({
    required this.location,
    required this.current,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: Location.formJson(json['location']),
      current: Current.formJson(json['current']),
    );
  }

  void getWeatherData() {}
}

class Location {
  String name;
  String country;
  String localtime;
  Location({
    required this.country,
    required this.localtime,
    required this.name,
  });
  factory Location.formJson(Map<String, dynamic> json) {
    return Location(
      country: json['country'],
      localtime: json['localtime'],
      name: json['name'],
    );
  }
}

class Current {
  Condition condition;

  String lastUpdated;
  double tempC;
  Current({
    required this.condition,
    required this.lastUpdated,
    required this.tempC,
  });
  factory Current.formJson(Map<String, dynamic> json) {
    return Current(
      lastUpdated: json['last_updated'],
      tempC: json['temp_c'],
      condition: Condition.formJson(json['condition']),
    );
  }
}

class Condition {
  String text;
  String icon;
  Condition({
    required this.icon,
    required this.text,
  });
  factory Condition.formJson(Map<String, dynamic> json) {
    return Condition(
      icon: json['icon'],
      text: json['text'],
    );
  }
}
