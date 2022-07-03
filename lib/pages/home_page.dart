import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:master_flutter/models/catalog.dart';
import 'package:master_flutter/widgets/drawer.dart';
import 'package:master_flutter/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/item_widget.dart';

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
                const CatalogList().expand()
              else
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
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

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Catalog App'.text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        'Trending Products'.text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return CatalogItem(catalog: catalog);
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: catalog.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.bold.color(MyTheme.darkBluishColor).make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mH8,
              children: [
                '\$${catalog.price}'.text.bold.xl.make(),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add_shopping_cart_outlined),
                  onPressed: () {},
                  label: 'Buy'.text.make(),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(MyTheme.darkBluishColor),
                    shape: MaterialStateProperty.all(const StadiumBorder())
                  ),
                )
              ],
            )
          ],
        ))
      ],
    )).white.roundedSM.square(150).make().py4();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
