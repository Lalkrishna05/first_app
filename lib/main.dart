import 'package:first_app/pages/cart_page.dart';
import 'package:first_app/pages/homepage.dart';
import 'package:first_app/pages/login_page.dart';
import 'package:first_app/utils/routes.dart';
import 'package:first_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:first_app/pages/order_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.LightTheme(context),
      darkTheme: MyTheme.darktheme(context),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.homeRoute: (context) => homepage(),
        MyRoutes.loginRoute: (context) => loginpage(),
        MyRoutes.cartRoute: (context) => cartpage(),
        MyRoutes.orderroute: (context) => const contactpage(),
      },
    );
  }
}
