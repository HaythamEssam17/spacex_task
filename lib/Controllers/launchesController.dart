import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spacex_app/Helpers/sharedTexts.dart';
import 'package:spacex_app/Models/launchModel.dart';

class LaunchesController extends ChangeNotifier {
  Dio _dio = Dio();

  bool isLoading = false;
  bool loadNextLaunch = false;
  List<LaunchModel> launchesList = [];
  List<LaunchModel> launchesPreviousList = [];
  List<LaunchModel> filteredList = [];
  LaunchModel launchModel;
  LaunchModel nextLaunchModel;

  bool get getIsLoading => isLoading;
  bool get getLoadNextLaunch => loadNextLaunch;
  List<LaunchModel> get getLaunchesList => launchesList;
  List<LaunchModel> get getLaunchesPreviousList => launchesPreviousList;
  List<LaunchModel> get getFilteredList => filteredList;
  LaunchModel get getLaunchModel => launchModel;
  LaunchModel get getNextLaunchModel => nextLaunchModel;

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

  Future<LaunchModel> fetchNextLaunch() async {
    loadNextLaunch = true;

    await _dio.get(SharedTexts.baseUrl + 'launches/next').then((value) {
      nextLaunchModel = LaunchModel.fromJson(value.data);

      print('launchModel: ${nextLaunchModel.name}');
    });

    loadNextLaunch = false;
    notifyListeners();

    return nextLaunchModel;
  }

//////////////////
  int inDays = 0;
  int inHours = 0;
  int inMinutes = 0;
  int inSeconds = 0;
  void getDifferenceDate(DateTime endDate) {
    DateTime date2 = DateTime.now();
    inDays = date2.difference(endDate).inDays;
    inHours = date2.difference(endDate).inHours;
    inMinutes = date2.difference(endDate).inMinutes;
    inSeconds = date2.difference(endDate).inSeconds;

    notifyListeners();
  }
}
