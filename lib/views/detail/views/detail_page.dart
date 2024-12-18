import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  late HomeProvider detailProviderW;
  late HomeProvider detailProviderR;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getDataCovid(); // Fetching the data
  }

  @override
  Widget build(BuildContext context) {
    detailProviderR = context.read<HomeProvider>();
    detailProviderW = context.watch<HomeProvider>();
    int modelIndex = ModalRoute.of(context)?.settings.arguments as int;

    final dataModel = detailProviderW.apiModel?.data[modelIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text("Details for ${dataModel?.apiRegionModel?.name ?? ''}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (dataModel != null) ...[
                Text(
                  "Date: ${dataModel.date}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text("Confirmed Cases: ${dataModel.confirmed}"),
                Text("Deaths: ${dataModel.deaths}"),
                Text("Recovered: ${dataModel.recovered}"),
                Text("Active Cases: ${dataModel.active}"),
                Text(
                    "Fatality Rate: ${dataModel.fatalityRate?.toStringAsFixed(2)}%"),
                const SizedBox(height: 16),
                const Text(
                  "Region Information:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                if (dataModel.apiRegionModel != null) ...[
                  Text("Region Name: ${dataModel.apiRegionModel?.name}"),
                  Text("ISO Code: ${dataModel.apiRegionModel?.iso}"),
                  Text("Province: ${dataModel.apiRegionModel?.province}"),
                  Text("Latitude: ${dataModel.apiRegionModel?.lat}"),
                  Text("Longitude: ${dataModel.apiRegionModel?.long}"),
                ] else
                  const Text("No region data available."),
                const SizedBox(height: 16),
                const Text(
                  "City Details:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                if (dataModel.apiRegionModel?.cityList != null &&
                    dataModel.apiRegionModel!.cityList!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: dataModel.apiRegionModel!.cityList!.map((city) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("City Name: ${city.name}"),
                                Text("Date: ${city.date}"),
                                Text("FIPS: ${city.fips}"),
                                Text("Latitude: ${city.lat}"),
                                Text("Longitude: ${city.long}"),
                                Text("Confirmed: ${city.confirmed}"),
                                Text("Deaths: ${city.deaths}"),
                                Text("Confirmed Diff: ${city.confirmedDiff}"),
                                Text("Deaths Diff: ${city.deathsDiff}"),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  )
                else
                  const Text("No city details available."),
              ] else
                const Text("No data available."),
            ],
          ),
        ),
      ),
    );
  }
}
