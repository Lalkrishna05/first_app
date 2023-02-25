import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import '../themes.dart';

class ShopBuzzHeader extends StatelessWidget {
  const ShopBuzzHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "ShopBuzz App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
      "Trending products".text.xl2.make(),
    ]);
  }
}
