import 'package:flutter/material.dart';
import '../helper/helper.dart';
import '../model/data_model.dart';

class HomeProvider with ChangeNotifier {
  RegionModel? apiModel;
  DataModel? dataModel;

  Future<void> getRegion() async {
    apiModel = await APIHelper.helper.fetchRegion();
    notifyListeners();
  }

  Future<void> getDataCovid() async {
    dataModel = await APIHelper.helper.fetchData();
    notifyListeners();
  }
}
