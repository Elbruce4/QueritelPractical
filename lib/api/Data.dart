import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:queritel_practical/api/DioConfig.dart';

getInfoCats (context) async {
  try {

    var dio = await getDio(context);
    var response = await dio.get("https://mocki.io/v1/77290441-d8e9-483f-80a2-a336a3364bbe");
    return response.data;

  } catch (e) {
    return e;
  }
}

getInfoDogs (context) async {
  try {

    var dio = await getDio(context);
    var response = await dio.get("https://mocki.io/v1/442a4801-5715-474a-b6fd-7548ab2f8d20");
    return response.data;

  } catch (e) {
    return e;
  }
}