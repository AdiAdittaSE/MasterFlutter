import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:master_flutter/models/catalog.dart';
import 'package:master_flutter/utils/routes.dart';
import 'package:master_flutter/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString('assets/files/catalog.json');
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData['products'];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    print(productsData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                const CatalogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(CupertinoIcons.cart, color: Colors.white,),
        onPressed: (){
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        backgroundColor: MyTheme.darkBluishColor,
        //elevation: 0,
      ),
      // appBar: AppBar(
      //   title: const Text('Catalog App'),
      //   centerTitle: true,
      // ),
      // drawer: const MyDrawer(),
      // body: CatalogModel.items != null && CatalogModel.items.isNotEmpty
      //     ? GridView.builder(
      //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
      //         itemBuilder: (context, index) => Card(
      //             clipBehavior: Clip.antiAlias,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //             child: GridTile(
      //               header: Container(
      //                 padding: const EdgeInsets.all(12),
      //                 decoration: const BoxDecoration(
      //                   color: Colors.blue,
      //                 ),
      //                 child: Text(
      //                   CatalogModel.items[index].name,
      //                   style: const TextStyle(color: Colors.white),
      //                 ),
      //               ),
      //               footer: Container(
      //                 padding: const EdgeInsets.all(12),
      //                 decoration: const BoxDecoration(
      //                   color: Colors.black,
      //                 ),
      //                 child: Text(
      //                   '\$${CatalogModel.items[index].price.toString()}',
      //                   style: const TextStyle(color: Colors.white),
      //                 ),
      //               ),
      //               child: Image.network(
      //                 CatalogModel.items[index].image,
      //                 fit: BoxFit.fill,
      //               ),
      //             )),
      //         itemCount: CatalogModel.items.length,
      //       )
      //     // ListView.builder(
      //     //     itemCount: CatalogModel.items.length,
      //     //     itemBuilder: (context, index) => ItemWidget(
      //     //       item: CatalogModel.items[index],
      //     //     ))
      //     : const Center(
      //         child: CircularProgressIndicator(),
      //       ),
    );
  }
}






