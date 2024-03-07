import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/design/colors.dart';
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
        backgroundColor: appBarBackgroundColor,
        title: Text(
          'Weather App',
          style: TextStyle(color: textColor),
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
                color: textColor,
              ),
            ),
          )
        ],
      ),
      backgroundColor: scaffoldBackgroundColor,
      body: ref.watch(homeNotifier).isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: appBarBackgroundColor,
              ),
            )
          : RefreshIndicator(
              onRefresh: () => ref.read(homeNotifier.notifier).getCityWeather(),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 16,
                      bottom: 50,
                    ),
                    child: Column(
                      children: [
                        Visibility(
                          visible: showSearchField,
                          child: Container(
                            height: 46,
                            child: AppTextField(
                              textController: ref.watch(homeNotifier).cityName!,
                              hintText: 'Search',
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    ref.read(homeNotifier.notifier).search();
                                  },
                                  child: Image.asset(
                                    'assets/images/search.webp',
                                    width: 24,
                                    color: textColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: ref.read(homeNotifier).isFiledEmpty!,
                          child: Text(
                            'Please don\'t leave the field empty',
                            style: TextStyle(
                              color: errorColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: !ref.read(homeNotifier).isCityValid!,
                          child: Text(
                            'City is not valid',
                            style: TextStyle(
                              color: errorColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${ref.watch(homeNotifier).homeModel!.name}',
                              style: TextStyle(
                                color: textColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    ref
                                        .read(homeNotifier.notifier)
                                        .changeUnit(true)
                                        .then((value) => ref
                                            .read(homeNotifier.notifier)
                                            .getCityWeather());
                                  },
                                  child: Text(
                                    '°Celsius',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize:
                                          ref.watch(homeNotifier).metricSystem!
                                              ? 20
                                              : 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  '/',
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    ref
                                        .read(homeNotifier.notifier)
                                        .changeUnit(false)
                                        .then((value) => ref
                                            .read(homeNotifier.notifier)
                                            .getCityWeather());
                                  },
                                  child: Text(
                                    '°Fahrenheit',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize:
                                          !ref.watch(homeNotifier).metricSystem!
                                              ? 20
                                              : 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ref
                            .watch(homeNotifier.notifier)
                            .showImageBasedOnWeather(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            '${ref.watch(homeNotifier).homeModel!.tempInfoModel!.temp!.round()} ${ref.read(homeNotifier).metricSystem! ? '°C' : '°F'}',
                            style: TextStyle(fontSize: 62, color: textColor),
                          ),
                        ),
                        Text(
                          '${ref.watch(homeNotifier).homeModel!.weatherModel!.first.main}',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${ref.watch(homeNotifier).homeModel!.weatherModel!.first.description}',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        TwoTextsRow(
                          '${ref.watch(homeNotifier).homeModel!.tempInfoModel!.maxTemp!.round()} / ${ref.watch(homeNotifier).homeModel!.tempInfoModel!.minTemp!.round()} ${ref.read(homeNotifier).metricSystem! ? '°C' : '°F'}',
                          'Max / Min',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TwoTextsRow(
                          '${ref.watch(homeNotifier).homeModel!.tempInfoModel!.pressure}',
                          'Pressure',
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
                ],
              ),
            ),
    );
  }
}
