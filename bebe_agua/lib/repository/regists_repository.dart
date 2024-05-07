
import 'dart:io';
import 'package:flutter/foundation.dart';

import '../http/http_client.dart';
import '../models/regist.dart';


class RegistRepository{
  final HttpClient _client;

  RegistRepository({required HttpClient client}) : _client = client;

  Future<List<Regist>> getRegists() async {
    final response = await _client.get(url: 'http://192.168.1.86:8000/DrinkWatter/GetAllRegists');

    if (response.statusCode == 200)
    {
      print(response);
    }else{
      throw Exception('satus code: ${response.statusCode}');
    }

    return[
      Regist(waterDrunk: 10,date:  DateTime.parse("2022-10-10")),
      Regist(waterDrunk:  12, date: DateTime.parse("2022-10-10")),
      Regist(waterDrunk: 13,date: DateTime.parse("2022-10-11")),
      Regist(waterDrunk: 14,date: DateTime.parse("2022-10-11"))
    ];
  }
}
