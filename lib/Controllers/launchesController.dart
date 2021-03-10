import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spacex_app/Helpers/sharedTexts.dart';
import 'package:spacex_app/Models/launchModel.dart';

class LaunchesController extends ChangeNotifier {
  Dio _dio = Dio();

  bool isLoading = false;
  List<LaunchModel> launchesList = [];
  List<LaunchModel> launchesPreviousList = [];
  List<LaunchModel> filteredList = [];
  LaunchModel launchModel;

  bool get getIsLoading => isLoading;
  List<LaunchModel> get getLaunchesList => launchesList;
  List<LaunchModel> get getLaunchesPreviousList => launchesPreviousList;
  List<LaunchModel> get getFilteredList => filteredList;
  LaunchModel get getLaunchModel => launchModel;

  Future<String> fetchAllLaunches() async {
    isLoading = true;

    var result = await _dio.get(SharedTexts.baseUrl + 'launches').then((value) {
      launchesList =
          (value.data as List).map((e) => LaunchModel.fromJson(e)).toList();
      print('launchesList: ${launchesList.length}');
    });

    isLoading = false;
    notifyListeners();

    return result;
  }

  Future<String> fetchUpComingLaunches() async {
    isLoading = true;

    var result =
        await _dio.get(SharedTexts.baseUrl + 'launches/upcoming').then((value) {
      launchesList =
          (value.data as List).map((e) => LaunchModel.fromJson(e)).toList();
      print('launchesList: ${launchesList.length}');
    });

    isLoading = false;
    notifyListeners();

    return result;
  }

  Future<String> fetchLaunchDetailsByID(String id) async {
    isLoading = true;

    var result =
        await _dio.get(SharedTexts.baseUrl + 'launches/$id').then((value) {
      launchModel = LaunchModel.fromJson(value.data);

      print('launchModel: ${launchModel.name}');
    });

    isLoading = false;
    notifyListeners();

    return result;
  }

  Future<String> fetchPreviousLaunches() async {
    isLoading = true;

    var result =
        await _dio.get(SharedTexts.baseUrl + 'launches/past').then((value) {
      launchesPreviousList =
          (value.data as List).map((e) => LaunchModel.fromJson(e)).toList();
      print('launchesPreviousList: ${launchesPreviousList.length}');
    });

    isLoading = false;
    notifyListeners();

    return result;
  }

  Future<String> filterLaunches(DateTime fromDate, DateTime toDate) async {
    isLoading = true;

    var result = await _dio.get(SharedTexts.baseUrl + 'launches').then((value) {
      filteredList =
          (value.data as List).map((e) => LaunchModel.fromJson(e)).toList();
    });

    isLoading = false;
    notifyListeners();

    return result;
  }
}
