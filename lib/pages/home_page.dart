import 'package:flutter/material.dart';
import 'package:master_flutter/models/catalog.dart';
import 'package:master_flutter/widgets/drawer.dart';

import '../widgets/item_widget.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog App'),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: ListView.builder(itemBuilder: (context,index){
        return ItemWidget(item: CatalogModel.items[0],);
      }, itemCount: 10),
    );
  }
}
