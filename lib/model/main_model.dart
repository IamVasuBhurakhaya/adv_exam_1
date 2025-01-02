class MainModel {
  List<MainDataModel>? data = [];

  MainModel({this.data});

  factory MainModel.mapToModel(Map m1) {
    List list = m1['data'] ?? [];
    return MainModel(
      data: list.map((e) => MainDataModel.mapToModel(e)).toList(),
    );
  }
}

class MainDataModel {
  String? iso;
  String? name;

  MainDataModel({
    this.iso,
    this.name,
  });

  factory MainDataModel.mapToModel(Map m1) {
    return MainDataModel(
      iso: m1['iso'] ?? '',
      name: m1['name'] ?? '',
    );
  }
}
