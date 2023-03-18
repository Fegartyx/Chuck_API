import 'package:chuck_api/categories_page.dart';
import 'package:flutter/material.dart';
import 'package:chuck_api/Services/services.dart';

import 'Model/model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? data;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chuck'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Random',
              ),
              Tab(
                text: 'Categories',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data == null ? '' : data!),
                  ElevatedButton(
                      onPressed: () async {
                        Model? result = await Services.getRandom();
                        if (result != null) {
                          setState(() {
                            data = result.value;
                          });
                        }
                      },
                      child: const Text('Random')),
                ],
              ),
            ),
            // Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       ElevatedButton(
            //           onPressed: () async {
            //             Model? result = await Services.getCategories();
            //             if (result != null) {
            //               debugPrint(result.categories.toString());
            //             }
            //           },
            //           child: const Text('Random')),
            //     ],
            //   ),
            // ),
            CategoriesPage(),
          ],
        ),
      ),
    );
  }
}
