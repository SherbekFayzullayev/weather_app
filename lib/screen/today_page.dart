import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/view_model/provider_model.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/screen/samarqand_image.dart';
import 'package:weather_app/screen/screen_end.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Image.network(
                      'https:${value.data[0].current.condition.icon}',
                      fit: BoxFit.fill,
                      width: 250,
                      height: 250,
                    ),
                    Text(
                      value.data[0].current.tempC.toString(),
                      style: TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Precipitations',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    Image.asset('img/house.png'),
                    SizedBox(
                      child: Stack(
                        children: [
                          Image.asset('img/container.png'),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Today',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  DateFormat('d MMM').format(DateTime.parse(
                                      value.data[0].current.lastUpdated)),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 65),
                            child: Container(
                              color: Colors.grey,
                              height: 1,
                              width: 410,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 90),
                            child: SizedBox(
                              height: 150,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: value.data[0].forecast.forecastday[0]
                                    .hour.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Text(
                                        value.data[0].forecast.forecastday[0]
                                            .hour[index].temp_c
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                      Image.network(
                                          'https:${value.data[0].forecast.forecastday[0].hour[index].conditionHour.icon}'),
                                      Text(
                                        DateFormat('h:mm').format(
                                          DateTime.parse(
                                            value
                                                .data[0]
                                                .forecast
                                                .forecastday[0]
                                                .hour[index]
                                                .time,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SamarqandImage(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.location_on_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScreenEnd(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.add_circle_outline,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.menu,
                          size: 40,
                          color: Colors.white,
                        )
                      ],
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
    );
  }
}
