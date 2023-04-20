import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/config/constants.dart';
import 'package:weather_app/core/providers/capitals_list/capitals_list_provider.dart';

class CapitalsListPage extends ConsumerStatefulWidget {
  const CapitalsListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CapitalsListPageState();
}

class _CapitalsListPageState extends ConsumerState<CapitalsListPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final capitals = ref.watch(filterCapitalsListProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Container(
          height: 40,
          margin: const EdgeInsets.only(right: 16),
          child: TextFormField(
            maxLength: 100,
            controller: searchController,
            textAlignVertical: TextAlignVertical.center,
            maxLines: 1,
            style:
                TextStyle(fontSize: 16, color: primaryColor.withOpacity(0.8)),
            onSaved: (value) {
              capitals.updateList(value.toString());

              setState(() {});
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              isDense: true,
              counterText: '',
              hintText: 'Search country capitals by region',
              suffixIcon: const Icon(Icons.search, color: Colors.orange),
              border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: primaryColor.withOpacity(0.8))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: primaryColor.withOpacity(0.8))),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: primaryColor.withOpacity(0.8)),
              ),
            ),
          ),
        ),
      ),
      body: capitals.value.isEmpty
          ? ListView.builder(
              itemCount: capitals.value.length,
              itemBuilder: (context, index) {
                final capital = capitals.value[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      capitals.updateOrderList(capital);
                      context.go('/detailed_weather');
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on),
                              Text(capital.countryName.toString()),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(imgLogoUncircled),
                              Text(capital.capital.toString()),
                              capital.cityWeather != null
                                  ? Text(
                                      '${capital.cityWeather!.main!.temp} degrees')
                                  : const Text('0.0')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('No results found', style: TextStyle(fontSize: 20)),
            )),
    );
  }
}
