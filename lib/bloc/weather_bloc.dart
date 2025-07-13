import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';

abstract class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  final Position position;
  FetchWeather(this.position);
}

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final Weather weather;
  WeatherSuccess(this.weather);
}

class WeatherFailure extends WeatherState {}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        const String API_KEY = String.fromEnvironment('WEATHER_API_KEY'); // Securely load API key from environment variables
        if (API_KEY.isEmpty) {
          throw Exception('API key is missing or invalid');
        }

        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        print(weather);
        emit(WeatherSuccess(weather));
      } catch (e) {
        print('Error: ' + e.toString()); // Log the error for debugging
        emit(WeatherFailure());
      }
    });
  }
}

class Position {
  final double latitude;
  final double longitude;
  Position(this.latitude, this.longitude);
}