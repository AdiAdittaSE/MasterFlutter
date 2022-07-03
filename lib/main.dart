import 'package:flutter/material.dart';
import 'package:master_flutter/pages/cart_page.dart';
import 'package:master_flutter/pages/home_detail_page.dart';
import 'package:master_flutter/pages/home_page.dart';
import 'package:master_flutter/pages/login_page.dart';
import 'package:master_flutter/utils/routes.dart';
import 'package:master_flutter/widgets/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        '/': (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
