import 'package:data_class_plugin/data_class_plugin.dart';

@DataClass(fromJson: true, toJson: true)
class TempInfoModel {
  /// Shorthand constructor
  TempInfoModel({
    this.temp,
    this.feelsLike,
    this.minTemp,
    this.maxTemp,
    this.pressure,
    this.humidity,
  });

  /// Shorthand constructor
  final double? temp;
  final double? feelsLike;
  final double? minTemp;
  final double? maxTemp;
  final int? pressure;
  final int? humidity;

  /// Creates a new instance of [TempInfoModel] with optional new values
  TempInfoModel copyWith({
    final double? temp,
    final double? feelsLike,
    final double? minTemp,
    final double? maxTemp,
    final int? pressure,
    final int? humidity,
  }) {
    return TempInfoModel(
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      minTemp: minTemp ?? this.minTemp,
      maxTemp: maxTemp ?? this.maxTemp,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
    );
  }

  /// Converts [TempInfoModel] to a [Map] json
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': minTemp,
      'temp_max': maxTemp,
      'pressure': pressure,
      'humidity': humidity,
    };
  }

  /// Creates an instance of [TempInfoModel] from [json]
  factory TempInfoModel.fromJson(Map<dynamic, dynamic> json) {
    return TempInfoModel(
      temp: json['temp'] == null ? null : json['temp'] as double,
      feelsLike:
          json['feels_like'] == null ? null : json['feels_like'] as double,
      minTemp: json['temp_min'] == null ? null : json['temp_min'] as double,
      maxTemp: json['temp_max'] == null ? null : json['temp_max'] as double,
      pressure: json['pressure'] == null ? null : json['pressure'] as int,
      humidity: json['humidity'] == null ? null : json['humidity'] as int,
    );
  }

  /// Returns a string with the properties of [TempInfoModel]
  @override
  String toString() {
    String value = 'TempInfoModel{<optimized out>}';
    assert(() {
      value =
          'TempInfoModel@<$hexIdentity>{temp: $temp, feelsLike: $feelsLike, minTemp: $minTemp, maxTemp: $maxTemp, pressure: $pressure, humidity: $humidity}';
      return true;
    }());
    return value;
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      temp,
      feelsLike,
      minTemp,
      maxTemp,
      pressure,
      humidity,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object? other) {
    return identical(this, other) ||
        other is TempInfoModel &&
            runtimeType == other.runtimeType &&
            temp == other.temp &&
            feelsLike == other.feelsLike &&
            minTemp == other.minTemp &&
            maxTemp == other.maxTemp &&
            pressure == other.pressure &&
            humidity == other.humidity;
  }
}
