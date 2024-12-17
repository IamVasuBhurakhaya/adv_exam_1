import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';
import '../../../uitls/routes..dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeProvider homeProviderWatch;
  late HomeProvider homeProviderRead;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<HomeProvider>().getRegion();
    });
  }

  @override
  Widget build(BuildContext context) {
    homeProviderWatch = context.watch<HomeProvider>();
    homeProviderRead = context.read<HomeProvider>();

    final regions = homeProviderWatch.dataModel. ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: regions.isEmpty
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
          itemCount: regions.length,
          itemBuilder: (context, index) {
            var region = regions[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.detail,
                  arguments: region,
                );
              },
              child: Card(
                child: ListTile(
                  title: Text(region.name),
                  subtitle: Text("ISO: ${region.iso}"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
