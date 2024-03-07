import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/widgets/app_text_field.dart';
import 'package:weather_app/modules/home/data/home_notifier.dart';
import 'package:weather_app/modules/home/widgets/two_texts_row.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool showSearchField = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff526DFD),
        title: Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  showSearchField = !showSearchField;
                });
              },
              child: Image.asset(
                'assets/images/search.webp',
                width: 24,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Color(0xff2F409E),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 50),
        child: Column(
          children: [
            Visibility(
              visible: showSearchField,
              child: Container(
                height: 46,
                child: AppTextField(
                  textController: ref.watch(homeNotifier).cityName!,
                  hintText: 'Search',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${ref.watch(homeNotifier).homeModel!.name}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        ref.read(homeNotifier.notifier).changeUnit(true).then(
                            (value) => ref
                                .read(homeNotifier.notifier)
                                .getCityWeather());
                      },
                      child: Text(
                        '°Celsius',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              ref.watch(homeNotifier).metricSystem! ? 20 : 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      '/',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        ref.read(homeNotifier.notifier).changeUnit(false).then(
                            (value) => ref
                                .read(homeNotifier.notifier)
                                .getCityWeather());
                      },
                      child: Text(
                        '°Fahrenheit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              !ref.watch(homeNotifier).metricSystem! ? 20 : 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ref.watch(homeNotifier.notifier).showImageBasedOnWeather(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                '${ref.watch(homeNotifier).homeModel!.tempInfoModel!.temp!.round()} ${ref.read(homeNotifier).metricSystem! ? '°C' : '°F'}',
                style: TextStyle(fontSize: 62, color: Colors.white),
              ),
            ),
            Text(
              '${ref.watch(homeNotifier).homeModel!.weatherModel!.first.main}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '${ref.watch(homeNotifier).homeModel!.weatherModel!.first.description}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            TwoTextsRow(
              '${ref.watch(homeNotifier).homeModel!.tempInfoModel!.maxTemp!.round()} / ${ref.watch(homeNotifier).homeModel!.tempInfoModel!.minTemp!.round()} ${ref.read(homeNotifier).metricSystem! ? '°C' : '°F'}',
              'Max / Min',
            ),
            SizedBox(
              height: 10,
            ),
            TwoTextsRow(
              '${ref.watch(homeNotifier).homeModel!.tempInfoModel!.pressure}',
              'pressure',
            ),
            SizedBox(
              height: 10,
            ),
            TwoTextsRow(
              '${ref.watch(homeNotifier).homeModel!.tempInfoModel!.humidity} %',
              'Humidity',
            ),
          ],
        ),
      ),
    );
  }
}
