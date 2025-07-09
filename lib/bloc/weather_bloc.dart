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
      emit(WeatherLoading());
      try {
        WeatherFactory wf = WeatherFactory(EnvironmentConfig.apiKey, language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
            if (!UserConsentValidator.hasConsent()) throw UserConsentException();
Weather weather = await wf.currentWeatherByLocation(event.position.latitude, event.position.longitude););
        // Removed debug print statement
        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(WeatherFailure(error: e.toString()));
      }
    });
  }
}
