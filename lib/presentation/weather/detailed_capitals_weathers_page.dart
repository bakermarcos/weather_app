import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/config/constants.dart';
import 'package:weather_app/core/providers/capitals_list/capitals_list_provider.dart';
import 'package:weather_icons/weather_icons.dart';

class DetailedWeatherPage extends ConsumerStatefulWidget {
  const DetailedWeatherPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailedWeatherPageState();
}

class _DetailedWeatherPageState extends ConsumerState<DetailedWeatherPage> {
  @override
  Widget build(BuildContext context) {
    final capitals = ref.watch(filterCapitalsListProvider);
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'Slider View',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: primaryColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.go('/capitals');
              },
            )),
        body: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            viewportFraction: 0.8,
          ),
          items: capitals.value.map((capital) {
            bool hasWeather = capital.cityWeather != null;
            String chanceOfRain = hasWeather
                ? '${(capital.cityWeather!.rain!.oneHour)! * 100}%'
                : '0%';

            return Builder(
              builder: (BuildContext context) {
                return Container(
                  color: primaryColor,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on),
                          Text(capital.capital.toString()),
                        ],
                      ),
                      Image.asset(imgLogoUncircled),
                      Text(
                        'Chance of Rain $chanceOfRain',
                        style: const TextStyle(color: Colors.white),
                      ),
                      capital.cityWeather != null
                          ? (Text(
                              capital.cityWeather!.weather!.first.description
                                      .toString()[0]
                                      .toUpperCase() +
                                  capital
                                      .cityWeather!.weather!.first.description
                                      .toString()
                                      .substring(1)
                                      .toLowerCase(),
                              style: const TextStyle(color: Colors.white),
                            ))
                          : const Text(
                              '',
                              style: TextStyle(color: Colors.white),
                            ),
                      hasWeather
                          ? Text(
                              capital.cityWeather!.main!.temp.toString(),
                              style: const TextStyle(color: Colors.white),
                            )
                          : const Text(
                              '',
                              style: TextStyle(color: Colors.white),
                            ),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(WeatherIcons.rain),
                              Text(
                                hasWeather ? chanceOfRain.toString() : '',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon((hasWeather
                                          ? (capital.cityWeather!.clouds!.all!)
                                          : 0) >
                                      1
                                  ? WeatherIcons.day_sunny
                                  : WeatherIcons.cloudy),
                              Text(
                                hasWeather
                                    ? capital.cityWeather!.clouds!.all
                                        .toString()
                                    : '0',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(WeatherIcons.wind),
                              Text(
                                '${hasWeather ? capital.cityWeather!.wind!.speed : 0} mp/h',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ));
  }
}
