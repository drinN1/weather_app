import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:weather_app/api/api_configuration.dart';
import 'package:weather_app/api/config.dart';
import 'package:weather_app/modules/home/model/home_model.dart';

class HomeService {
  ApiConfigurations apiConfig = ApiConfigurations();
  Future<HomeModel> getCityWeather(String cityName, String unit) async {
    Response response = await apiConfig.get(
      WeatherConfig.baseUrl,
      WeatherConfig.unencodedPath,
      {
        "q": cityName,
        "APPID": WeatherConfig.appId,
        "units": unit,
      },
    );

    HomeModel homeModel = HomeModel.fromJson(jsonDecode(response.body));

    return homeModel;
  }
}

final homeService = Provider<HomeService>((ref) => HomeService());
