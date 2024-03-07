import 'package:data_class_plugin/data_class_plugin.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/modules/home/model/home_model.dart';

@DataClass(copyWith: true)
class HomeState {
  HomeState.initial()
      : homeModel = null,
        isLoading = false,
        cityName = TextEditingController(),
        metricSystem = true,
        isFiledEmpty = false,
        isCityValid = true;

  /// Shorthand constructor
  HomeState({
    this.homeModel,
    required this.isLoading,
    this.cityName,
    this.metricSystem,
    this.isFiledEmpty,
    this.isCityValid,
  });

  /// Shorthand constructor
  final HomeModel? homeModel;
  final bool isLoading;
  final TextEditingController? cityName;
  final bool? metricSystem;
  final bool? isFiledEmpty;
  final bool? isCityValid;

  /// Creates a new instance of [HomeState] with optional new values
  HomeState copyWith({
    final HomeModel? homeModel,
    final bool? isLoading,
    final TextEditingController? cityName,
    final bool? metricSystem,
    final bool? isFiledEmpty,
    final bool? isCityValid,
  }) {
    return HomeState(
      homeModel: homeModel ?? this.homeModel,
      isLoading: isLoading ?? this.isLoading,
      cityName: cityName ?? this.cityName,
      metricSystem: metricSystem ?? this.metricSystem,
      isFiledEmpty: isFiledEmpty ?? this.isFiledEmpty,
      isCityValid: isCityValid ?? this.isCityValid,
    );
  }

  /// Returns a string with the properties of [HomeState]
  @override
  String toString() {
    String value = 'HomeState{<optimized out>}';
    assert(() {
      value =
          'HomeState@<$hexIdentity>{homeModel: $homeModel, isLoading: $isLoading, cityName: $cityName, metricSystem: $metricSystem, isFiledEmpty: $isFiledEmpty, isCityValid: $isCityValid}';
      return true;
    }());
    return value;
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      homeModel,
      isLoading,
      cityName,
      metricSystem,
      isFiledEmpty,
      isCityValid,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object? other) {
    return identical(this, other) ||
        other is HomeState &&
            runtimeType == other.runtimeType &&
            homeModel == other.homeModel &&
            isLoading == other.isLoading &&
            cityName == other.cityName &&
            metricSystem == other.metricSystem &&
            isFiledEmpty == other.isFiledEmpty &&
            isCityValid == other.isCityValid;
  }
}
