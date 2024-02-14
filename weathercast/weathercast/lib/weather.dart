//import 'package:http/http.dart' as http;

class Weather {
  // eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImQ5YjQ2YjA5ZGIzY2VjOGU3OTBkMWYwYzc0ODc2OGM2MzhiNjkxNWZkOTM2YTBiMGQ3YmVlMDQ4YmVkZDVjNjgyMTE1ZmE2YWUzOGY0M2VkIn0.eyJhdWQiOiIyIiwianRpIjoiZDliNDZiMDlkYjNjZWM4ZTc5MGQxZjBjNzQ4NzY4YzYzOGI2OTE1ZmQ5MzZhMGIwZDdiZWUwNDhiZWRkNWM2ODIxMTVmYTZhZTM4ZjQzZWQiLCJpYXQiOjE3MDc4ODIyMTgsIm5iZiI6MTcwNzg4MjIxOCwiZXhwIjoxNzM5NTA0NjE4LCJzdWIiOiIzMDEwIiwic2NvcGVzIjpbXX0.MjB7zTw78sFDJOuBmyzZOIE7jrtUI1jx_hqqPO83eE7IqbQBwVBlucFeW8dxxGFxTdwWpZo1A1GBQTUZih7Fl2mOPfiwG7ELis7BWTwni0PNgvouPEojyWN11VAP6Be19qu4Jr2pstXPwz4d3U-mZpNSoLMBPATL6AjHKDQBdDVx6FhLp2E7sV-skvLWubiulRzOMB4by_mnmKPyol8lvjWnXs4JUxJJrRREDl93dwVIY1LQN0zhDkFS7WTN12BFHIJq1IhNaFxJSpAX-9B0NqXz5WPe3pd_KIOqkGxAESjEAVqZrLxJQtMJ2194OqJg6dOYpIW_DCjUwBbEAAxirjDqbkRzU_TBZ1xNk5iNJIdAGSoxw9BDSjMkB388_sIQKf45aB04E8HN4-IaksKfmM-yofS1GxR8yfQabRZloJL-eIV25KphhmvTBSqc1PImM2RJ-CtGUz9ZrLRtvwLwFT4_w-T07Wc5OsA8-v0cMnqliOIj1vgcEILohS64B2ZhoZeqLvTrQcpc1zQJ9Qb8cawWG6HiS_JhOoOCnvRKKz-IkClVu9yw1Ul4Bvu76O0vFSuH1Gs6JQiPSZtFLHhGoctK0fjWaRarXx4iM8sgOUQwGckaAW8Wrbve3PPOEb_zWEAyiINyERE726SBIkOvYuDZDirq00f7wZz4AJifI6U
  static const _condition = [
    '',
    'ท้องฟ้าแจ่มใส (Clear)',
    'มีเมฆบางส่วน (Partly cloudy)',
    'เมฆเป็นส่วนมาก (Cloudy)',
    'มีเมฆมาก (Overcast)',
    'ฝนตกเล็กน้อย (Light rain)',
    'ฝนปานกลาง (Moderate rain)',
    'ฝนตกหนัก (Heavy rain)',
    'ฝนฟ้าคะนอง (Thunderstorm)',
    'อากาศหนาวจัด (Very cold)',
    'อากาศหนาว (Cold)',
    'อากาศเย็น (Cool)',
    'อากาศร้อนจัด (Very hot)',
  ];
  static const _symbol = [
    '',
    '🌈',
    '☁',
    '☁☁',
    '☁☁☁',
    '🌦',
    '🌧',
    '☔',
    '⛈',
    '☃',
    '⛄',
    '❄',
    '🔥',
  ];
  final String address;
  final double temperature;
  final int cond;
  Weather(
      {required this.address, required this.temperature, required this.cond});

  String get condition => _condition[cond];
  String get symbol => _symbol[cond];
}
