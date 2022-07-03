import 'package:flutter/material.dart';
import 'package:master_flutter/pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../theme.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
              onTap: () =>
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetail(catalog: catalog),
                  ),
                ),
              child: CatalogItem(catalog: catalog));
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(tag: Key(catalog.id.toString()),child: CatalogImage(image: catalog.image)),
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
              //buttonPadding: Vx.mH8,
              children: [
                '\$${catalog.price}'.text.bold.xl.make(),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add_shopping_cart_outlined),
                  onPressed: () {},
                  label: 'Add'.text.xl.bold.make(),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkBluishColor),
                      shape: MaterialStateProperty.all(const StadiumBorder())),
                )
              ],
            )
          ],
        ))
      ],
    )).white.roundedSM.square(150).make().py4();
  }
}
