import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/routes.dart';
import 'bookmark_provider/bookmark_provider.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  late BookMarkProvider providerW;
  late BookMarkProvider providerR;

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<BookMarkProvider>();
    providerR = context.read<BookMarkProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("BookMark"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: providerW.favoriteList.isEmpty
              ? const Center(
                  child: Text(
                    "No data Found",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: providerW.favoriteList.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.detail,
                                arguments: index);
                          },
                          child: Card(
                            child: ListTile(
                              title: Text(
                                providerW.favoriteList[index],
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    providerR.favoriteList.removeAt(index);
                                  },
                                  icon: const Icon(Icons.delete)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
    );
  }
}
