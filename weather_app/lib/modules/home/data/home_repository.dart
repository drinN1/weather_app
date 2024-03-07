import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/modules/home/data/home_service.dart';
import 'package:weather_app/modules/home/model/home_model.dart';

class HomeRepository {
  HomeService homeService;

  HomeRepository(this.homeService);

  Future<HomeModel?>? getCityWeather(String cityName, String unit) async {
    final result = homeService.getCityWeather(cityName, unit);

    return result;
  }
}

final homeRepository =
    Provider<HomeRepository>((ref) => HomeRepository(ref.read(homeService)));
