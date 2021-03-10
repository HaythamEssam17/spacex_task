import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spacex_app/Helpers/sharedTexts.dart';
import 'package:spacex_app/Models/rocketModel.dart';

class RocketController extends ChangeNotifier {
  Dio _dio = Dio();

  bool isLoading = false;
  RocketModel rocketModel;

  bool get getIsLoading => isLoading;
  RocketModel get getRocketModel => rocketModel;

  Future<String> fetchRocketDetailsByID(String id) async {
    isLoading = true;

    var result =
        await _dio.get(SharedTexts.baseUrl + 'rockets/$id').then((value) {
      rocketModel = RocketModel.fromJson(value.data);

      print('rocketModel: $rocketModel');
    });

    isLoading = false;
    notifyListeners();

    return result;
  }
}
