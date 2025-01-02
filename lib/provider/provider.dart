import 'package:flutter/material.dart';

import '../helper/helper.dart';
import '../model/data_model.dart';
import '../model/main_model.dart';

class HomeProvider with ChangeNotifier {
  MainModel? mainModel;
  String? city;
  APIModel? apiModel;
  List? bookMarkList;
  Future<void> getCovid() async {
    mainModel = await Helper.helper.fetchRegion();
    city = mainModel?.data?[0].name;
    notifyListeners();
  }

  Future<void> getDataCovid() async {
    apiModel = (await Helper.helper.fetchData(city!)) as APIModel?;
    notifyListeners();
  }
}
