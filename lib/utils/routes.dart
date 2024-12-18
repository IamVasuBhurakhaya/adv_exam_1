import 'package:flutter/material.dart';
import '../views/detail/views/detail_page.dart';
import '../views/home/views/home_page.dart';

class AppRoutes {
  static const String home = "/";
  static const String detail = "/detail";

  static Map<String, Widget Function(BuildContext)> routes = {
    "/": (context) => const HomePage(),
    "/detail": (context) => const DetailPage(),
  };
}
