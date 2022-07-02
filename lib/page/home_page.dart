import 'package:flutter/material.dart';

class HomePagae extends StatelessWidget {
  const HomePagae({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: Center(
        child: Text('Welecom to flutter'),
      ),
    );
  }
}
