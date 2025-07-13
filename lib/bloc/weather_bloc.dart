import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        // Validate API key format
        if (API_KEY == null || API_KEY.isEmpty || !RegExp(r'^[A-Za-z0-9]{32}$').hasMatch(API_KEY)) {
          throw Exception('Invalid API key format');
        }

        // Validate position
        if (event.position == null || event.position.latitude == null || event.position.longitude == null) {
          throw Exception('Position or its properties are null');
        }

        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude, event.position.longitude
        );
        print(weather);
        emit(WeatherSuccess(weather));
      } catch (e) {
        print('Error: ${e.toString()}');
        emit(WeatherFailure(e.toString()));
      }
    });
  }
}

// weather_event.dart
part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final Position position;

  const FetchWeather(this.position);

  @override
  List<Object> get props => [position];
}

// weather_state.dart
part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final Weather weather;

  const WeatherSuccess(this.weather);

  @override
  List<Object> get props => [weather];
}

class WeatherFailure extends WeatherState {
  final String error;

  const WeatherFailure(this.error);

  @override
  List<Object> get props => [error];
}