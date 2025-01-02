class APIModel {
  List<APIDataModel> data;

  APIModel({
    required this.data,
  });
  factory APIModel.mapToModel(Map map) {
    List l1 = map['data'];
    return APIModel(
      data: l1
          .map(
            (e) => APIDataModel.mapToModel(e),
          )
          .toList(),
    );
  }
}

class APIDataModel {
  DateTime? date;
  int? confirmed;
  int? deaths;
  int? recovered;
  int? confirmedDiff;
  int? deathsDiff;
  int? recoveredDiff;
  DateTime? lastUpdate;
  int? active;
  int? activeDiff;
  double? fatalityRate;
  APIRegionModel? apiRegionModel;

  APIDataModel({
    this.date,
    this.confirmed,
    this.deaths,
    this.recovered,
    this.confirmedDiff,
    this.deathsDiff,
    this.recoveredDiff,
    this.lastUpdate,
    this.active,
    this.activeDiff,
    this.fatalityRate,
    this.apiRegionModel,
  });

  factory APIDataModel.mapToModel(Map m1) {
    return APIDataModel(
      date: m1['date'],
      confirmed: m1['confirmed'],
      deaths: m1['deaths'],
      recovered: m1['recovered'],
      confirmedDiff: m1['confirmedDiff'],
      deathsDiff: m1['deathsDiff'],
      recoveredDiff: m1['recoveredDiff'],
      lastUpdate: m1['lastUpdate'],
      active: m1['active'],
      activeDiff: m1['activeDiff'],
      fatalityRate: m1['fatalityRate'],
      apiRegionModel: m1['region'],
    );
  }
}

class APIRegionModel {
  String? iso;
  String? name;
  String? province;
  String? lat;
  String? long;
  List<APICityModel>? cityList = [];

  APIRegionModel({
    this.iso,
    this.name,
    this.province,
    this.lat,
    this.long,
    this.cityList,
  });

  factory APIRegionModel.mapToModel(Map m1) {
    List regionList = m1['cities'];
    return APIRegionModel(
      iso: m1['iso'],
      name: m1['name'],
      province: m1['province'],
      lat: m1['lat'],
      long: m1['long'],
      cityList: regionList
          .map(
            (e) => APICityModel.mapToModel(e),
          )
          .toList(),
    );
  }
}

class APICityModel {
  String? name;
  DateTime? date;
  int? fips;
  String? lat;
  String? long;
  int? confirmed;
  int? deaths;
  int? confirmedDiff;
  int? deathsDiff;

  APICityModel({
    this.name,
    this.date,
    this.fips,
    this.lat,
    this.long,
    this.confirmed,
    this.deaths,
    this.confirmedDiff,
    this.deathsDiff,
  });

  factory APICityModel.mapToModel(Map m1) {
    return APICityModel(
      name: m1['name'],
      date: m1['date'],
      fips: m1['fips'],
      lat: m1['lat'],
      long: m1['long'],
      confirmed: m1['confirmed'],
      deaths: m1['deaths'],
      confirmedDiff: m1['confirmedDiff'],
      deathsDiff: m1['deathsDiff'],
    );
  }
}
