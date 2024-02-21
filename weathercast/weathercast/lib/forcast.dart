import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'location.dart';
import 'weather.dart';

Future<Weather> forecast() async {
  const url = 'https://data.tmd.go.th/nwpapi/v1/forecast/location/hourly/at';
  const token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImQ5YjQ2YjA5ZGIzY2VjOGU3OTBkMWYwYzc0ODc2OGM2MzhiNjkxNWZkOTM2YTBiMGQ3YmVlMDQ4YmVkZDVjNjgyMTE1ZmE2YWUzOGY0M2VkIn0.eyJhdWQiOiIyIiwianRpIjoiZDliNDZiMDlkYjNjZWM4ZTc5MGQxZjBjNzQ4NzY4YzYzOGI2OTE1ZmQ5MzZhMGIwZDdiZWUwNDhiZWRkNWM2ODIxMTVmYTZhZTM4ZjQzZWQiLCJpYXQiOjE3MDc4ODIyMTgsIm5iZiI6MTcwNzg4MjIxOCwiZXhwIjoxNzM5NTA0NjE4LCJzdWIiOiIzMDEwIiwic2NvcGVzIjpbXX0.MjB7zTw78sFDJOuBmyzZOIE7jrtUI1jx_hqqPO83eE7IqbQBwVBlucFeW8dxxGFxTdwWpZo1A1GBQTUZih7Fl2mOPfiwG7ELis7BWTwni0PNgvouPEojyWN11VAP6Be19qu4Jr2pstXPwz4d3U-mZpNSoLMBPATL6AjHKDQBdDVx6FhLp2E7sV-skvLWubiulRzOMB4by_mnmKPyol8lvjWnXs4JUxJJrRREDl93dwVIY1LQN0zhDkFS7WTN12BFHIJq1IhNaFxJSpAX-9B0NqXz5WPe3pd_KIOqkGxAESjEAVqZrLxJQtMJ2194OqJg6dOYpIW_DCjUwBbEAAxirjDqbkRzU_TBZ1xNk5iNJIdAGSoxw9BDSjMkB388_sIQKf45aB04E8HN4-IaksKfmM-yofS1GxR8yfQabRZloJL-eIV25KphhmvTBSqc1PImM2RJ-CtGUz9ZrLRtvwLwFT4_w-T07Wc5OsA8-v0cMnqliOIj1vgcEILohS64B2ZhoZeqLvTrQcpc1zQJ9Qb8cawWG6HiS_JhOoOCnvRKKz-IkClVu9yw1Ul4Bvu76O0vFSuH1Gs6JQiPSZtFLHhGoctK0fjWaRarXx4iM8sgOUQwGckaAW8Wrbve3PPOEb_zWEAyiINyERE726SBIkOvYuDZDirq00f7wZz4AJifI6U';
  try {
    Position location = await getCurrentLocation();
    http.Response response = await http.get(
        Uri.parse(
            '$url?lat=${location.latitude}&lon=${location.longitude}&fields=tc,cond'),
        headers: {
          'accept': 'application/json',
          'authorization': 'Bearer $token',
        });
    // return Weather(address: response.body, temperature: 0, cond: 0);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)["WeatherForecasts"][0]["forecasts"]
          [0]["data"];
      Placemark address = (await placemarkFromCoordinates(
              location.latitude, location.longitude))
          .first;
      return Weather(
          address: '${address.subLocality}\n${address.administrativeArea}',
          temperature: result['tc'],
          cond: result['cond']);
    } else {
      return Future.error(response.statusCode);
    }
  } catch (e) {
    return Future.error(e);
  }
}
