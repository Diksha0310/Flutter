import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData()async{
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    final productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(50, (int index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.white,
        title: Text("Catalog APP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
            ?GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context,index){
              final item = CatalogModel.items[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                  child: GridTile(
                    header: Container(child: Text(item.name,style: TextStyle(color: Colors.white),),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                      ),
                    ),
                      child: Image.network(item.image),
                    footer: Container(child: Text(item.price.toString(),
                      style: TextStyle(color: Colors.white),),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                    ),//Text(item.price.toString()),
                  ));
            },
            itemCount: CatalogModel.items.length,
        ) :Center(
          child: CircularProgressIndicator(),
        ), ),

      drawer: MyDrawer(),
    );
  }
}
