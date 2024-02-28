import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/services/weather_api.dart';
import 'package:weather_app/screen/today_page.dart';
import '../data/view_model/provider_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ProviderModel>().getData();
    super.initState();
  }

  WeatherApi weatherApi = WeatherApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
                return Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Image.network(
                        'https:${value.data[0].current.condition.icon}',
                        fit: BoxFit.fill,
                        width: 350,
                        height: 350,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Column(
                          children: [
                            Text(
                              'Weather',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 60,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'ForeCasts',
                        style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 60,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 90),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            padding: EdgeInsets.symmetric(
                                horizontal: 80, vertical: 15),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TodayPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Get Start',
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 35, 6, 64),
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Image.asset('img/404.jpg');
              }
            },
          ),
        ),
      ),
    );
  }
}
