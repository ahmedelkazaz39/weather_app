import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_two/cubits/get_current_weather_cubit/get_weather_cubit.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: TextField(
          onSubmitted: (value) async {
            var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
            getWeatherCubit.getWeather(cintyName: value);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 15,
            ),
            suffixIcon: const Icon(Icons.search),
            labelText: 'Search',
            labelStyle: const TextStyle(
              fontSize: 20,
            ),
            hintText: 'Enter a city name',
            hintStyle: const TextStyle(
              fontSize: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
