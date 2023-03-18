import 'package:chuck_api/Services/services.dart';
import 'package:chuck_api/single_category_page.dart';
import 'package:flutter/material.dart';

import 'Model/model.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late Future _data;

  @override
  void initState() {
    // TODO: implement initState
    _data = Services.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Model? data = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingleCategoryPage(
                              category: data.categories![index]),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(data.categories![index]),
                    ),
                  ),
                );
              },
              itemCount: data!.categories!.length,
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
        future: _data,
      ),
    );
  }
}
