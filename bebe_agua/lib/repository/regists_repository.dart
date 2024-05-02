
import 'dart:io';
import 'package:flutter/foundation.dart';

import '../http/http_client.dart';
import '../models/regist.dart';


class RegistRepository{
  final HttpClient _client;

  RegistRepository({required HttpClient client}) : _client = client;

  Future<String> getRegists() async {
    final response = await _client.get(url: 'https://localhost:7044/DrinkWatter/GetAllRegists');

    if (response.statusCode == 200)
    {
      print(response);
      return 'ok';
    }else{
      throw Exception('satus code: ${response.statusCode}');
    }
  }




}