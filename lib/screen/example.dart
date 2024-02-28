import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/view_model/provider_model.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Example')),
      body: Consumer<ProviderModel>(
        builder: (context, value, child) {
          if (value.data.isEmpty) {
            return const CircularProgressIndicator();
          }
          if (value.data.isNotEmpty) {
            return SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.data[0].forecast.forecastday[0].hour.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(3, 4),
                            blurRadius: 8,
                          )
                        ]),
                    child: Column(
                      children: [
                        Image.network(
                            'https:${value.data[0].forecast.forecastday[0].hour[index].conditionHour.icon}'),
                        Text(DateFormat('h:mm').format(DateTime.parse(value
                            .data[0]
                            .forecast
                            .forecastday[0]
                            .hour[index]
                            .time))),
                      ],
                    ),
                  );
                  // return ListTile(
                  //   leading: Image.network(
                  //       'https:${value.data[0].forecast.forecastday[0].hour[index].conditionHour.icon}'),
                  //   title: Text(
                  //       value.data[0].forecast.forecastday[0].hour[index].time),
                  // );
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<ProviderModel>().getData();
      }),
    );
  }
}
