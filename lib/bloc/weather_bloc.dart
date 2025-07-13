import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/data/my_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  static const String API_KEY = 'your_valid_api_key_here'; // Replace with a valid API key

  WeatherBloc() : super(WeatherInitial()) {
    on<fetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        if (API_KEY.isEmpty || !RegExp(r'^[A-Za-z0-9]+$').hasMatch(API_KEY)) {
          throw Exception('Invalid API key format');
        }

        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        print(weather);
        emit(WeatherSuccess(weather));
      } catch (e) {
        print('Error: $e');
        emit(WeatherFailure());
      }
    });
  }
}