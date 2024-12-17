import 'package:covid_19/provider/provider.dart';
import 'package:covid_19/uitls/routes..dart';
import 'package:covid_19/views/detail/views/detail_page.dart';
import 'package:covid_19/views/home/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Routes.home: (context) => const HomePage(),
          Routes.detail: (context) => const DetailPage(),
        },
      ),
    );
  }
}
