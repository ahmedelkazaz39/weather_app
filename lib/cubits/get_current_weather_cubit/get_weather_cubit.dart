import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_two/services/weather_service.dart';
import '../../models/weather_model.dart';
import 'get_weather_states.dart';

/// create cubit
class GetWeatherCubit extends Cubit<WeatherCubitStates> {
  GetWeatherCubit() : super(WeatherInitialState());
 late WeatherModel weatherModel;

  getWeather({required String cintyName}) async {
    try {
        weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cintyName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailureState(
        e.toString(),
      ));
    }
  }
}
