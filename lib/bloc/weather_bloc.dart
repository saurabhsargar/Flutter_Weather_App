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
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);

        // Format temperature
        String formattedTemperature = _formatTemperature(weather.temperature);

        print(weather);
        emit(WeatherSuccess(weather, formattedTemperature));
      } catch (e) {
        print('Error fetching weather: $e');
        emit(WeatherFailure());
      }
    });
  }

  String _formatTemperature(Temperature? temperature) {
    if (temperature == null) {
      return 'N/A';
    }
    return '${temperature.celsius?.toStringAsFixed(1) ?? 'N/A'} °C';
  }
}

// Update WeatherSuccess state to include formatted temperature
part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final Weather weather;
  final String formattedTemperature;

  const WeatherSuccess(this.weather, this.formattedTemperature);

  @override
  List<Object?> get props => [weather, formattedTemperature];
}

class WeatherFailure extends WeatherState {}

// WeatherEvent remains unchanged
part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class fetchWeather extends WeatherEvent {
  final Position position;

  const fetchWeather(this.position);

  @override
  List<Object?> get props => [position];
}