import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:first_app/widgets/themes.dart';

import '../models/ShopBuzz.dart';
import '../utils/routes.dart';
import '../widgets/drawer.dart';
import '../widgets/home_widgets/ShopBuzzList.dart';
import '../widgets/home_widgets/ShopBuzzheader.dart';
import '../widgets/item_widget.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  void initState() {
    super.initState();
    //loadData();
  }

  // loadData() async {
  //   await Future.delayed(Duration(seconds: 1));
  //   var shopbuzzJson =
  //       await rootBundle.loadString("../assets/files/shopbuzz.json");
  //   var decodeddata = json.decode(shopbuzzJson);
  //   var productsdata = decodeddata["products"];
  //   ShopBuzzModel.items =
  //       List.from(productsdata).map((item) => Item.fromMap(item)).toList();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    //final dummylist = List.generate(20, (index) => ShopBuzzModel.items[0]);
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: MyTheme.darkBluishColor,
        child: Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ShopBuzzHeader(),
            if (ShopBuzzModel.items != null && ShopBuzzModel.items.isNotEmpty)
              shopbuzzlist().expand()
            else
              Center(
                child: CircularProgressIndicator(),
              )
          ]),
        ).py24(),
      ),
    );
  }
}
