import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/view_model/provider_model.dart';
import 'package:weather_app/screen/example.dart';
import 'package:weather_app/screen/home_page.dart';
import 'package:weather_app/screen/samarqand_image.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProviderModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
