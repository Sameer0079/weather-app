import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  // ignore: non_constant_identifier_names
  final String API_KEY;
  // ignore: non_constant_identifier_names
  WeatherBloc({required this.API_KEY}) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      try {
        emit(WeatherLoading());

        WeatherFactory weatherFactory = WeatherFactory(API_KEY);
        Weather weather = await weatherFactory.currentWeatherByLocation(
            event.location.latitude, event.location.longitude);

        emit(WeatherSuccess(weather: weather));
      } catch (e) {
        emit(WeatherFailed());
        log('error $e');
      }
    });
  }
}
