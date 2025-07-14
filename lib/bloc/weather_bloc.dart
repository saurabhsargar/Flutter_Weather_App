import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<fetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        const String API_KEY = String.fromEnvironment('WEATHER_API_KEY'); // Securely retrieve API key
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        print(weather);
        emit(WeatherSuccess(weather));
      } catch (e) {
        // Enhanced error logging
        print('Error in WeatherService module: ' + e.toString());
        emit(WeatherFailure());
      }
    });
  }
}

abstract class WeatherEvent {}

class fetchWeather extends WeatherEvent {
  final Position position;

  fetchWeather(this.position);
}

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final Weather weather;

  WeatherSuccess(this.weather);
}

class WeatherFailure extends WeatherState {}

class Position {
  final double latitude;
  final double longitude;

  Position(this.latitude, this.longitude);
}