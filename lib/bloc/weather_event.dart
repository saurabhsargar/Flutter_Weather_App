part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class fetchWeather extends WeatherEvent {
  final Position position;
if (position.latitude == null || position.longitude == null) {
  throw ArgumentError("Invalid position: latitude and longitude must not be null");
}

  const fetchWeather(this.position);

  @override
  List<Object> get props => [];
}
