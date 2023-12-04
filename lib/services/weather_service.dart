

import 'package:dio/dio.dart';
import 'package:weather_app_two/models/weather_model.dart';


class WeatherService {
  final Dio dio;
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'e1648d8a8ff4488f9de213205231306';
  //e1648d8a8ff4488f9de213205231306

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    }
    on DioException catch (e) {
      final String errorException = e.response?.data['error']['message'] ??
          "oops there is an error try later !!";
      throw Exception(errorException);
    }
    catch (e) {
      e.toString();
       throw Exception('oops there is an error try later');
    }
  }
}
