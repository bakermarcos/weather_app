import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/config/constants.dart';
import 'package:weather_app/core/providers/capitals_list/repositories/list_provider.dart';
import 'package:weather_icons/weather_icons.dart';

class DetailedWeatherPage extends ConsumerStatefulWidget {
  const DetailedWeatherPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailedWeatherPageState();
}

class _DetailedWeatherPageState extends ConsumerState<DetailedWeatherPage> {
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final capitals = ref.watch(capitalsListRepositoryProvider);
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
            elevation: 0,
            title: const Text(
              'Slider View',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: primaryColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.go('/capitals_list');
              },
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                aspectRatio: 0.5,
                viewportFraction: 1,
                enableInfiniteScroll: true,
              ),
              items: capitals.map((capital) {
                bool hasWeather = capital.cityWeather != null;
                String chanceOfRain = hasWeather
                    ? '${(capital.cityWeather!.rain!.oneHour)! * 100}%'
                    : '0%';

                return Builder(
                  builder: (BuildContext context) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.location_on,
                                    color: Colors.white),
                                Text(capital.capital.toString(),
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SizedBox(
                                height: 100,
                                child: Image.asset(imgLogoUncircled),
                              ),
                            ),
                          ),
                          Text(
                            'Chance of Rain $chanceOfRain',
                            style: const TextStyle(color: Colors.white),
                          ),
                          capital.cityWeather != null
                              ? (Text(
                                  capital.cityWeather!.weather!.first
                                          .description
                                          .toString()[0]
                                          .toUpperCase() +
                                      capital.cityWeather!.weather!.first
                                          .description
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
                          Expanded(
                            child: SizedBox(
                              height: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        WeatherIcons.rain,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        hasWeather
                                            ? chanceOfRain.toString()
                                            : '',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        (hasWeather
                                                    ? (capital.cityWeather!
                                                        .clouds!.all!)
                                                    : 0) >
                                                1
                                            ? WeatherIcons.day_sunny
                                            : WeatherIcons.cloudy,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        hasWeather
                                            ? capital.cityWeather!.clouds!.all
                                                .toString()
                                            : '0',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        WeatherIcons.wind,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${hasWeather ? capital.cityWeather!.wind!.speed : 0} mp/h',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ));
  }
}
