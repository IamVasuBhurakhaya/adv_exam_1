import 'package:flutter/material.dart';
import '../helper/helper.dart';
import '../model/data_model.dart';
import '../model/main_model.dart';

class HomeProvider with ChangeNotifier {
  RegionModel? regionModel;
  APIModel? apiModel;

  Future<void> getRegion() async {
    regionModel = await APIHelper.helper.fetchRegion();
    notifyListeners();
  }

  Future<void> getDataCovid() async {
    apiModel = await APIHelper.helper.fetchData();
    notifyListeners();
  }
}
