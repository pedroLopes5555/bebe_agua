
import 'dart:io';
import 'package:flutter/foundation.dart';

import '../http/http_client.dart';
import '../models/regist.dart';


class RegistRepository{
  final HttpClient _client;

  RegistRepository({required HttpClient client}) : _client = client;

  Future<List<Regist>> getRegists() async {
    final response = await _client.get(url: 'https://127.0.0.1:7044/DrinkWatter/GetAllRegists');

    if (response.statusCode == 200)
    {
      print(response);
    }else{
      throw Exception('satus code: ${response.statusCode}');
    }

    return[
      Regist.test(10, DateTime.parse("2022-10-10")),
      Regist.test(12, DateTime.parse("2022-10-10")),
      Regist.test(13, DateTime.parse("2022-10-11")),
      Regist.test(14, DateTime.parse("2022-10-11"))
    ];
  }
}
