import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/data/my_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeatherEvent>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherFactory wf = WeatherFactory(EnvironmentConfig.apiKey, language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
            if (event.position.latitude == null || event.position.longitude == null) {
  emit(WeatherFailure(message: "Invalid position input"));
  return;
}

Weather weather = await wf.currentWeatherByLocation(event.position.latitude, event.position.longitude););
        // Removed debug print statement
        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(WeatherFailure(message: e.toString()));
      }
    });
  }
}