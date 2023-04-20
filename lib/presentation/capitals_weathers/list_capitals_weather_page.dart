import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/config/constants.dart';
import 'package:weather_app/core/entities/capital_entity.dart';
import 'package:weather_app/core/providers/capitals_list/repositories/list_provider.dart';

class CapitalsListPage extends ConsumerStatefulWidget {
  const CapitalsListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CapitalsListPageState();
}

class _CapitalsListPageState extends ConsumerState<CapitalsListPage> {
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;

  Future<void> updateList() async {
    isLoading = true;
    setState(() {});
    await ref
        .read(capitalsListRepositoryProvider.notifier)
        .updateList(searchController.text.toString())
        .then((value) => ref
            .read(capitalsListRepositoryProvider.notifier)
            .searchWeather()
            .then((value) => setState(() {})));
    setState(() {});
    isLoading = false;
  }

  updateOrderList(CapitalEntity capitalEntity) {
    ref
        .read(capitalsListRepositoryProvider.notifier)
        .updateOrderList(capitalEntity);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await updateList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<CapitalEntity> capitals = ref.watch(capitalsListProvider);
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
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              isDense: true,
              counterText: '',
              hintText: 'Search country capitals by region',
              suffixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Colors.orange),
                  onPressed: () async {
                    await updateList();
                  }),
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
      body: capitals.isNotEmpty
          ? !isLoading
              ? ListView.builder(
                  itemCount: capitals.length,
                  itemBuilder: (context, index) {
                    final capital = capitals[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          isLoading = true;
                          setState(() {});
                          updateOrderList(capital);
                          context.push('/detailed_weather');
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      const Icon(Icons.location_on),
                                      Expanded(
                                          child: Text(
                                              capital.countryName.toString())),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                        height: 25,
                                        child: Image.asset(imgLogoUncircled)),
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
                      ),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                )
          : const Center(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'No results found',
                  style: TextStyle(
                    fontSize: 20,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
    );
  }
}
