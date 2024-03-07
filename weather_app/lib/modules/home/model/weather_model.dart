import 'package:data_class_plugin/data_class_plugin.dart';

@DataClass(fromJson: true, toJson: true)
class WeatherModel {
  /// Shorthand constructor
  WeatherModel({
    this.id,
    this.main,
    this.description,
  });

  /// Shorthand constructor
  final int? id;
  final String? main;
  final String? description;

  /// Creates a new instance of [WeatherModel] with optional new values
  WeatherModel copyWith({
    final int? id,
    final String? main,
    final String? description,
  }) {
    return WeatherModel(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
    );
  }

  /// Converts [WeatherModel] to a [Map] json
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'main': main,
      'description': description,
    };
  }

  /// Creates an instance of [WeatherModel] from [json]
  factory WeatherModel.fromJson(Map<dynamic, dynamic> json) {
    return WeatherModel(
      id: json['id'] == null ? null : json['id'] as int,
      main: json['main'] == null ? null : json['main'] as String,
      description:
          json['description'] == null ? null : json['description'] as String,
    );
  }
}
