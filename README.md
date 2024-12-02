# Weather App 🌦️

A Flutter-based Weather App that displays weather details using the BLoC (Business Logic Component) pattern. The app fetches data from the OpenWeather API and provides an intuitive user experience.

## Features ✨
- Current weather details for any city.
- Sunrise and sunset timings.
- Maximum and minimum temperature display.
- State management using the BLoC pattern.

## Screenshots 📱
![App Screenshot](assets\Screenshot1.png)

## Installation 🚀
1. Clone the repository:
git clone https://github.com/saurabhsargar/Flutter_Weather_App.git
cd weather-app

2. Install dependencies:
flutter pub get

3. Add your OpenWeather API key:
Replace <YOUR_API_KEY> in the lib\data\my_data.dart or relevant file with your API key.
You can get your API key from OpenWeather.

4. Run the app:
flutter run

## Project Structure 📂
The app follows a clean architecture with separation of concerns:
- BLoC: Handles business logic and state management.
- UI: Contains widgets for rendering the user interface.
- Data: Fetches weather data using the OpenWeather API.

## Dependencies 🛠️
geolocator: ^12.0.0
weather: ^3.1.1
intl: ^0.19.0
flutter_bloc: ^8.1.6
equatable: ^2.0.5