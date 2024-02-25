import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/data/modelss/one_call/one_call_models/one_call_data_models.dart';
import 'package:weather_app/data/modelss/simple/weather_model/weather_model.dart';

import '../../utils/constants/constants.dart';
import '../response.dart';

class ApiProvider {
  static Future<MyResponse> getSimpleWeatherInfo(String city) async {
    Map<String, String> queryParams = {
      "appid": AppConstants.apiKey,
      "q": city,
    };

    Uri uri = Uri.https(
      AppConstants.baseUrl,
      "/data/2.5/weather",
      queryParams,
    );

    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return MyResponse(
            data: WeatherM.fromJson(jsonDecode(response.body)));
      } else {
        return MyResponse(errorText: "OTHER ERROR:${response.statusCode}");
      }
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> getComplexWeatherInfo() async {
    Map<String, String> queryParams = {
      "lat": "41.2646",
      "lon": "69.2163",
      "units": "metric",
      "exclude": "minutely,current",
      "appid": "4a8eaf9ed512f638cdd7a82434895402",
    };

    Uri uri = Uri.https(
      AppConstants.baseUrl,
      "/data/2.5/onecall",
      queryParams,
    );


    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return MyResponse(
            data: OneCallDataModels.fromJson(data));
      } else {
        return MyResponse(errorText: "OTHER ERROR:${response.statusCode}");
      }
    } catch (error) {
      print(error.toString());
      return MyResponse(errorText: error.toString());
    }
  }
}
