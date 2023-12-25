import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(50, (int index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.white,
        title: Text("Catalog APP"),
      ),
      body: ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (context, index){
          return ItemWidget(item: dummyList[index],);
        },),
      drawer: MyDrawer(),
    );
  }
}
