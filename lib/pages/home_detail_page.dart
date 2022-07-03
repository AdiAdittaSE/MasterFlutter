import 'package:flutter/material.dart';
import 'package:master_flutter/models/catalog.dart';
import 'package:master_flutter/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetail extends StatelessWidget {
  final Item catalog;

  HomeDetail({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mH8,
          children: [
            '\$${catalog.price}'.text.bold.xl4.red800.make(),
            ElevatedButton.icon(
              icon: const Icon(Icons.add_shopping_cart_outlined),
              onPressed: () {},
              label: 'Add to cart'.text.xl.bold.make(),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MyTheme.darkBluishColor),
                  shape: MaterialStateProperty.all(const StadiumBorder())),
            ).wh(150, 50)
          ],
        ).p8(),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image))
                  .h32(context),
              VxArc(
                height: 30.0,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.bold
                          .color(MyTheme.darkBluishColor)
                          .make(),
                      catalog.desc.text.xl
                          .textStyle(context.captionStyle)
                          .make(),
                      10.heightBox,
                      'I would like to begin by drawing your attention to the title of this lecture:'
                              ' "Religious Belief and Public Morality: A Catholic Governor\'s Perspective."'
                              ' I was not invited to speak on "Church and State" generally. Certainly not "Mondale vs.'
                              ' Reagan.I would like to begin by drawing your attention to the title of this lecture:'
                              ' "Religious Belief and Public Morality: A Catholic Governor\'s Perspective."'
                              ' I was not invited to speak on "Church and State" generally. Certainly not "Mondale vs.'
                              ' Reagan."'
                          .text
                          .textStyle(context.captionStyle)
                          .xl
                          .align(TextAlign.justify)
                          .make()
                          .p16()
                    ],
                  ).pOnly(top: 64),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
