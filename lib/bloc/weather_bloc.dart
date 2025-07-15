import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/data/my_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<fetchWeather>((event, emit) async {
  final WeatherService weatherService = WeatherService();
      emit(WeatherLoading());
      try {
        WeatherFactory wf = WeatherFactory(EnvironmentConfig.apiKey, language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        Logger.logInfo('Weather data fetched successfully: ${weather.toString()}');
        emit(WeatherSuccess(weather));
      } catch (e) {
        Logger.logError('Failed to fetch weather data: ${e.toString()}');
emit(WeatherFailure());
      }
    });
  }
}