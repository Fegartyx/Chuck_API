import 'package:chuck_api/Services/services.dart';
import 'package:flutter/material.dart';

import 'Model/model.dart';

class SingleCategoryPage extends StatefulWidget {
  const SingleCategoryPage({Key? key, required this.category})
      : super(key: key);
  final String category;

  @override
  State<SingleCategoryPage> createState() => _SingleCategoryPageState();
}

class _SingleCategoryPageState extends State<SingleCategoryPage> {
  late Future _data;
  @override
  void initState() {
    // TODO: implement initState
    _data = Services.getSpecific(category: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Model data = snapshot.data;
              return Column(
                children: [
                  Text('id : ${data.id}'),
                  Text('categories : ${data.categories!.map((e) => e)}'),
                  Text('value : ${data.value}'),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
          future: _data),
    );
  }
}
