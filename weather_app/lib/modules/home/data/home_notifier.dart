import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/modules/home/data/home_repository.dart';
import 'package:weather_app/modules/home/data/home_state.dart';

class HomeNotifier extends Notifier<HomeState> {
  late HomeRepository _homeRepository;
  @override
  build() {
    state = HomeState.initial();
    _homeRepository = ref.read(homeRepository);
    return state;
  }

  void reGetCityWeather() {
    getCityWeather().then((value) => state = state.copyWith(homeModel: value));
  }

  Future getCityWeather() async {
    state = state.copyWith(isLoading: true);

    final weatherData = await _homeRepository
        .getCityWeather(
      state.cityName!.text,
      state.metricSystem! ? 'metric' : 'imperial',
    )!
        .then((value) {
      if (value!.name == null) {
        state = state.copyWith(isCityValid: false);
      } else {
        state = state.copyWith(isCityValid: true, homeModel: value);
      }
    });

    state = state.copyWith(isLoading: false);

    return weatherData;
  }

  Future<void> changeUnit(bool value) async {
    state = state.copyWith(metricSystem: value);
  }

  Future<void> changeIsEmptyBool(bool value) async {
    state = state.copyWith(isFiledEmpty: value);
  }

  Widget showImageBasedOnWeather() {
    if (state.homeModel!.weatherModel!.first.main == "Clouds") {
      return Image.asset(
        'assets/images/clouds.png',
        width: 150,
      );
    } else if (state.homeModel!.weatherModel!.first.main == "Rain") {
      return Image.asset(
        'assets/images/rain.png',
        width: 150,
      );
    } else if (state.homeModel!.weatherModel!.first.main == "Snow") {
      return Image.asset(
        'assets/images/snow.png',
        width: 150,
      );
    } else {
      return Image.asset(
        'assets/images/weather_logo.webp',
        width: 150,
      );
    }
  }

  Future search() async {
    if (state.cityName!.text.isEmpty) {
      changeIsEmptyBool(true);
    } else {
      changeIsEmptyBool(false);
      getCityWeather();
    }
    state = state.copyWith();
  }
}

final homeNotifier = NotifierProvider<HomeNotifier, HomeState>(() {
  return HomeNotifier();
});
