import '../network/api_provider.dart';
import '../response.dart';

class WeatherRepository {
  Future<MyResponse> getSimpleWeatherInfo(String city) =>
      ApiProvider.getSimpleWeatherInfo(city);

  Future<MyResponse> getComplexWeatherInfo() =>
      ApiProvider.getComplexWeatherInfo();
}