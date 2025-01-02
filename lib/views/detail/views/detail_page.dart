import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';
import '../../bookmark/bookmark_provider/bookmark_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late HomeProvider pW;
  late HomeProvider pR;
  late BookMarkProvider providerW;
  late BookMarkProvider providerR;

  @override
  void initState() {
    context.read<HomeProvider>().getCovid();
    context.read<HomeProvider>().getDataCovid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pR = context.read<HomeProvider>();
    pW = context.watch<HomeProvider>();
    providerR = context.read<BookMarkProvider>();
    providerW = context.watch<BookMarkProvider>();
    int index = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          pW.mainModel?.data?[index].name ?? 'Details',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {
              String bookmarkName =
                  pW.mainModel?.data?[index].name ?? 'Unknown';
              providerW.addFavourite(name: bookmarkName);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    "$bookmarkName added to bookmarks!",
                    style: const TextStyle(fontSize: 16),
                  ),
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              );
            },
            icon: const Icon(
              Icons.bookmark,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${pW.mainModel?.data?[index].name}",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Date: ${pW.apiModel?.data[index].date ?? 'N/A'}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const Divider(thickness: 1, height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildStatistic(
                            "Active", "${pW.apiModel?.data[index].active}"),
                        buildStatistic("Recovered",
                            "${pW.apiModel?.data[index].recovered}"),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildStatistic(
                            "Deaths", "${pW.apiModel?.data[index].deaths}"),
                        buildStatistic("Confirmed",
                            "${pW.apiModel?.data[index].confirmed}"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStatistic(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
