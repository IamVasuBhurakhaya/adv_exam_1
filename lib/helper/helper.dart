import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/main_model.dart';

class Helper {
  static Helper helper = Helper._();
  Helper._();
  Future<MainModel?> fetchRegion() async {
    String link = "https://covid-19-statistics.p.rapidapi.com/regions";

    http.Response response = await http.get(Uri.parse(link), headers: {
      "x-rapidapi-host": "covid-19-statistics.p.rapidapi.com",
      "x-rapidapi-key": "15e08b4c8dmsh6070c2aa3738a3cp145e39jsnd649680af011"
    });

    if (response.statusCode == 200) {
      var allData = jsonDecode(response.body);
      MainModel model = MainModel.mapToModel(allData);
      return model;
    }
    return null;
  }

  Future<MainDataModel?> fetchData(String city) async {
    String link =
        "https://covid-19-statistics.p.rapidapi.com/reports?&q=$city&date=2020-04-16";
    http.Response response = await http.get(Uri.parse(link), headers: {
      "x-rapidapi-host": "covid-19-statistics.p.rapidapi.com",
      "x-rapidapi-key": "15e08b4c8dmsh6070c2aa3738a3cp145e39jsnd649680af011",
    });

    if (response.statusCode == 200) {
      var allData = jsonDecode(response.body);
      MainDataModel model = MainDataModel.mapToModel(allData);
      return model;
    }
    return null;
  }
}
