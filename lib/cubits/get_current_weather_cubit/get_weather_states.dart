class WeatherCubitStates {}

class WeatherInitialState extends WeatherCubitStates {}

class WeatherLoadedState extends WeatherCubitStates {}

class WeatherFailureState extends WeatherCubitStates {
  final String errorMessage;

  WeatherFailureState(this.errorMessage);
}
