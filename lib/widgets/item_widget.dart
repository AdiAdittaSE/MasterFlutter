import 'package:flutter/material.dart';
import 'package:master_flutter/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: ListTile(
          onTap: (){},
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text('\$${item.price.toString()}',textScaleFactor: 1.2, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
