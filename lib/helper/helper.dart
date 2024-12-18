import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/data_model.dart';
import '../model/main_model.dart';

class APIHelper {
  static APIHelper helper = APIHelper._();
  APIHelper._();

  Future<RegionModel?> fetchRegion() async {
    String link = "https://covid-19-statistics.p.rapidapi.com/regions";

    try {
      http.Response response = await http.get(Uri.parse(link), headers: {
        "x-rapidapi-host": "covid-19-statistics.p.rapidapi.com",
        "x-rapidapi-key": "15e08b4c8dmsh6070c2aa3738a3cp145e39jsnd649680af011"
      });

      if (response.statusCode == 200) {
        var allData = jsonDecode(response.body);
        return RegionModel.mapToModel(allData);
      } else {
        print("Failed to load regions: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<APIModel?> fetchData() async {
    String link =
        "https://covid-19-statistics.p.rapidapi.com/reports?city_name=Autauga&region_province=Alabama&iso=USA&region_name=US&q=US%20Alabama&date=2020-04-16";

    try {
      http.Response response = await http.get(Uri.parse(link), headers: {
        "x-rapidapi-host": "covid-19-statistics.p.rapidapi.com",
        "x-rapidapi-key": "15e08b4c8dmsh6070c2aa3738a3cp145e39jsnd649680af011"
      });

      if (response.statusCode == 200) {
        var allData = jsonDecode(response.body);
        return APIModel.mapToModel(allData);
      } else {
        print("Failed to load data: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
