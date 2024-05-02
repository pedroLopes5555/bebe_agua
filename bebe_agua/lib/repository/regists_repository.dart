
import 'dart:io';
import 'package:flutter/foundation.dart';

import '../http/http_client.dart';
import '../models/regist.dart';


class RegistRepository{
  final HttpClient _client;

  RegistRepository({required HttpClient client}) : _client = client;

  /*Future<String> getRegists() async {
    final response = await _client.get(url: 'https://localhost:7044/DrinkWatter/GetAllRegists');

    if (response.statusCode == 200)
    {
      print(response);
      return 'ok';
    }else{
      throw Exception('satus code: ${response.statusCode}');
    }

  }*/

  List<Regist> getRegists(){
    return[
      Regist.test(10, DateTime.parse("10/10/2022")),
      Regist.test(12, DateTime.parse("10/10/2022")),
      Regist.test(13, DateTime.parse("11/10/2022")),
      Regist.test(14, DateTime.parse("11/10/2022"))
    ];
  }




  int getDayWatterDrunk() {
    return 10;
  }




}