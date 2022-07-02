import 'package:flutter/material.dart';
import 'package:master_flutter/widgets/drawer.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: const Center(child: Text('Home Page'),),
    );
  }
}
