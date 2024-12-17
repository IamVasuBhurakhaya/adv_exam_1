class RegionModel {
  List<RegionDataModel>? data;

  RegionModel({this.data});

  factory RegionModel.mapToModel(Map map) {
    List list = map['data'] ?? [];
    return RegionModel(
      data: list.map((e) => RegionDataModel.mapToModel(e)).toList(),
    );
  }
}

class RegionDataModel {
  String? iso;
  String? name;

  RegionDataModel({
    this.iso,
    this.name,
  });

  factory RegionDataModel.mapToModel(Map map) {
    return RegionDataModel(
      iso: map['iso'] ?? '',
      name: map['name'] ?? '',
    );
  }
}
