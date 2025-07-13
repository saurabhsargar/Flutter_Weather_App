import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';

class WeatherEvent {
  final Position position;
  WeatherEvent(this.position);
}

class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final Weather weather;
  WeatherSuccess(this.weather);
}

class WeatherFailure extends WeatherState {}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      emit(WeatherLoading());
      try {
        const String API_KEY = 'your_api_key_here'; // Replace with your actual API key
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

        // Ensure proper memory management
        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        print(weather);
        emit(WeatherSuccess(weather));
      } catch (e) {
        if (e is OutOfMemoryError) {
          print('OutOfMemoryError: Consider optimizing memory usage.');
        } else {
          print('Error: ' + e.toString()); // Log the error for debugging
        }
        emit(WeatherFailure());
      } finally {
        // Dispose of resources if necessary
      }
    });
  }
}

// Additional optimization for image loading
class ImageLoader {
  static Future<void> loadBackgroundImage(String imagePath) async {
    try {
      // Use optimized image loading techniques
      print('Loading image: $imagePath');
      // Implement caching or use smaller image sizes
    } catch (e) {
      if (e is OutOfMemoryError) {
        print('OutOfMemoryError while loading image: $imagePath');
      } else {
        print('Error loading image: ' + e.toString());
      }
    }
  }
}