class WeatherModel {
  Forecast forecast;
  Location location;
  Current current;
  WeatherModel({
    required this.forecast,
    required this.location,
    required this.current,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      forecast: Forecast.fromJson(json['forecast']),
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

class Forecast {
  final List<ForecastDay> forecastday;
  Forecast({
    required this.forecastday,
  });
  factory Forecast.fromJson(Map<String, dynamic> json) {
    List<ForecastDay> forecastData = [];
    json['forecastday'].forEach((e) {
      forecastData.add(ForecastDay.fromJson(e));
    });

    return Forecast(
      forecastday: List.from(forecastData),
    );
  }
}

class ForecastDay {
  String date;
  Day day;
  Astro astro;
  List<Hour> hour;

  ForecastDay({
    required this.date,
    required this.day,
    required this.hour,
    required this.astro,
  });
  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    List<Hour> d = [];
    json['hour'].forEach((value) {
      d.add(Hour.fromJson(value));
    });
    return ForecastDay(
      date: json['date'],
      day: Day.fromJson(json['day']),
      hour: List.from(d),
      astro: Astro.fromJson(json['astro']),
    );
  }
}

class Astro {
  String sunset;
  String sunrise;
  Astro({
    required this.sunset,
    required this.sunrise,
  });
  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(
      sunset: json['sunset'],
      sunrise: json['sunrise'],
    );
  }
}

class Hour {
  String time;
  double temp_c;
  ConditionHour conditionHour;
  Hour({
    required this.temp_c,
    required this.time,
    required this.conditionHour,
  });
  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
      conditionHour: ConditionHour.fromJson(json['condition']),
      temp_c: json['temp_c'],
      time: json['time'],
    );
  }
}

class ConditionHour {
  final String icon;
  ConditionHour({
    required this.icon,
  });
  factory ConditionHour.fromJson(Map<String, dynamic> json) {
    return ConditionHour(icon: json['icon']);
  }
}

class Day {
  double uv;
  double maxtemp_f;
  double mintemp_f;
  double max;
  double min;
  Condition2 condition2;
  Day({
    required this.uv,
    required this.maxtemp_f,
    required this.mintemp_f,
    required this.max,
    required this.condition2,
    required this.min,
  });
  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      uv: json['uv'],
      maxtemp_f: json['maxtemp_f'],
      mintemp_f: json['mintemp_f'],
      max: json['maxtemp_c'],
      min: json['mintemp_c'],
      condition2: Condition2.fromJson(
        json['condition'],
      ),
    );
  }
}

class Condition1 {
  String icon;
  Condition1({
    required this.icon,
  });
  factory Condition1.fromJson(Map<String, dynamic> json) {
    return Condition1(icon: json['icon']);
  }
}

class Condition2 {
  String icon;
  Condition2({
    required this.icon,
  });
  factory Condition2.fromJson(Map<String, dynamic> json) {
    return Condition2(icon: json['icon']);
  }
}
