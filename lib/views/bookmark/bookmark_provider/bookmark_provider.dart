import 'package:flutter/material.dart';

class BookMarkProvider extends ChangeNotifier {
  List<String> favoriteList = [];

  BookMarkProvider();

  void addFavourite({required String name}) {
    if (favoriteList.contains(name)) {
      favoriteList.remove(name);
    } else {
      favoriteList.add(name);
    }
    notifyListeners();
  }

  bool checkStatus({required String name}) {
    return favoriteList.contains(name);
  }

  List<String> get getAllFavourite {
    return favoriteList;
  }
}
