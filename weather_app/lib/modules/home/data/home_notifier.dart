import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/modules/home/data/home_repository.dart';
import 'package:weather_app/modules/home/data/home_state.dart';
import 'package:weather_app/modules/home/model/home_model.dart';

class HomeNotifier extends Notifier<HomeState> {
  late HomeRepository _homeRepository;
  @override
  build() {
    state = HomeState.initial();
    _homeRepository = ref.read(homeRepository);
    getCityWeather().then((value) => state = state.copyWith(homeModel: value));
    return state;
  }

  void reGetCityWeather() {
    getCityWeather().then((value) => state = state.copyWith(homeModel: value));
  }

  Future<HomeModel?> getCityWeather() async {
    state = state.copyWith(isLoading: true);

    final weatherData = await _homeRepository.getCityWeather(
      state.cityName!.text,
      state.metricSystem! ? 'metric' : 'imperial',
    );

    state = state.copyWith(isLoading: false);

    return weatherData;
  }
}

final homeNotifier = NotifierProvider<HomeNotifier, HomeState>(() {
  return HomeNotifier();
});
