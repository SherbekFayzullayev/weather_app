import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/view_model/provider_model.dart';
import 'package:weather_app/screen/home_page.dart';

class ScreenEnd extends StatefulWidget {
  const ScreenEnd({super.key});

  @override
  State<ScreenEnd> createState() => _ScreenEndState();
}

class _ScreenEndState extends State<ScreenEnd> {
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
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text(
                        value.data[0].location.name,
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: Text(
                            'Max: ',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                        Text(
                          value.data[0].forecast.forecastday[0].day.max
                              .toString(),
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text(
                            'Min: ',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                        Text(
                          value.data[0].forecast.forecastday[0].day.min
                              .toString(),
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 120, top: 30),
                      child: Text(
                        '3-Days Forecasts',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 190,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.data[0].forecast.forecastday.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Container(
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 40),
                                        child: Image.asset('img/uzuncon2.png'),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 40, top: 20),
                                            child: Text(
                                              value.data[0].forecast
                                                  .forecastday[index].day.min
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 45),
                                            child: Image.network(
                                                'https:${value.data[0].forecast.forecastday[index].day.condition2.icon}'),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 45),
                                            child: Text(
                                              DateFormat('EEE').format(
                                                  DateTime.parse(value
                                                      .data[0]
                                                      .forecast
                                                      .forecastday[index]
                                                      .date)),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20),
                      child: Container(
                        child: Stack(
                          children: [
                            Image.asset('img/cantainer2.png'),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 20),
                              child: Row(
                                children: [
                                  Image.asset('img/nishon.png'),
                                  Text(
                                    '  AIR QUALITY',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 55, left: 17),
                              child: Text(
                                '3-Low Health Risk',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 110, left: 25),
                              child: Image.asset('img/line.png'),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 130, left: 20),
                              child: Row(
                                children: [
                                  Text(
                                    'See more                                    ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 30,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 40),
                      child: Row(
                        children: [
                          Container(
                            child: Stack(
                              children: [
                                Image.asset('img/con1.png'),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 10),
                                  child: Row(
                                    children: [
                                      Image.asset('img/star.png'),
                                      Text(
                                        'SUNRISE',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 60, left: 15),
                                  child: Text(
                                    value.data[0].forecast.forecastday[0].astro
                                        .sunrise,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 27,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 110, left: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Sunset: ',
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 169, 166, 166),
                                            fontSize: 17),
                                      ),
                                      Text(
                                        value.data[0].forecast.forecastday[0]
                                            .astro.sunset,
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 169, 166, 166),
                                            fontSize: 17),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Stack(
                              children: [
                                Image.asset('img/con1.png'),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    children: [
                                      Image.asset('img/star.png'),
                                      Text(
                                        'UV INDEX',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 60, left: 15),
                                  child: Text(
                                    value.data[0].forecast.forecastday[0].day.uv
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 27, color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 90, left: 15),
                                  child: Text(
                                    'Moderate',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 45,
                        ))
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
