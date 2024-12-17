import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late HomeProvider detailProviderW;
  late HomeProvider detailProviderR;
  @override
  void initState() {
    context.read<HomeProvider>().getDataCovid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    detailProviderR = context.read<HomeProvider>();
    detailProviderW = context.watch<HomeProvider>();
    int ind = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text("${detailProviderW.dataModel!.region!.name}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Text(
                "${detailProviderW.dataModel!.region!.name}",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
