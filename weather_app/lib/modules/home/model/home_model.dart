import 'package:data_class_plugin/data_class_plugin.dart';
import 'package:weather_app/modules/home/model/temp_info_model.dart';
import 'package:weather_app/modules/home/model/weather_model.dart';

@DataClass(fromJson: true, toJson: true)
class HomeModel {
  /// Shorthand constructor
  HomeModel({
    this.id,
    this.name,
    this.weatherModel,
    this.tempInfoModel,
  });

  /// Shorthand constructor
  final int? id;
  final String? name;
  final List<WeatherModel>? weatherModel;
  final TempInfoModel? tempInfoModel;

  /// Creates a new instance of [HomeModel] with optional new values
  HomeModel copyWith({
    final int? id,
    final String? name,
    final List<WeatherModel>? weatherModel,
    final TempInfoModel? tempInfoModel,
  }) {
    return HomeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      weatherModel: weatherModel ?? this.weatherModel,
      tempInfoModel: tempInfoModel ?? this.tempInfoModel,
    );
  }

  /// Converts [HomeModel] to a [Map] json
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'weather': weatherModel == null
          ? null
          : <dynamic>[
              for (final WeatherModel i0 in weatherModel!) i0.toJson(),
            ],
      'main': tempInfoModel?.toJson(),
    };
  }

  /// Creates an instance of [HomeModel] from [json]
  factory HomeModel.fromJson(Map<dynamic, dynamic> json) {
    return HomeModel(
      id: json['id'] == null ? null : json['id'] as int,
      name: json['name'] == null ? null : json['name'] as String,
      weatherModel: json['weather'] == null
          ? null
          : <WeatherModel>[
              for (final dynamic i0 in (json['weather'] as List<dynamic>))
                WeatherModel.fromJson(i0),
            ],
      tempInfoModel:
          json['main'] == null ? null : TempInfoModel.fromJson(json['main']),
    );
  }
}
