class WeatherModel {
  final String cityName;
  final DateTime  date;
  final String? image;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String condition;

  WeatherModel({
    required this.image,
    required this.date,
    required this.cityName,
    required this.maxTemp,
    required this.condition,
    required this.minTemp,
    required this.temp,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      date: DateTime.parse(json['current']['last_updated']),
      cityName: json["location"]["name"],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      temp: json['current']['temp_c'],
    );
  }
}
