import 'package:flutter/material.dart';

import '../views/bookmark/bookmark_screen.dart';
import '../views/detail/views/detail_page.dart';
import '../views/home/views/home_page.dart';

class AppRoutes {
  static const String home = "/";
  static const String detail = "/detail";
  static const String bookmark = "/bookmark";

  static Map<String, Widget Function(BuildContext)> routes = {
    "/": (context) => const HomeScreen(),
    "/detail": (context) => const DetailScreen(),
    "/bookmark": (context) => const BookmarkScreen(),
  };
}
