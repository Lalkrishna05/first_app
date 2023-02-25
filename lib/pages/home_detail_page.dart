// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:first_app/widgets/home_widgets/ShopBuzzList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:first_app/models/ShopBuzz.dart';
import 'package:first_app/widgets/themes.dart';

import '../utils/routes.dart';

class HomeDetailPage extends StatelessWidget {
  final Item shopbuzz;
  const HomeDetailPage({
    Key? key,
    required this.shopbuzz,
  })  : assert(shopbuzz != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: MyTheme.creamColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${shopbuzz.price}".text.red800.bold.xl4.make(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.cartRoute);
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MyTheme.darkBluishColor),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              child: "Buy".text.make(),
            ).wh(120, 60),
          ],
        ).p64(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(shopbuzz.id.toString()),
                    child: Image.asset(shopbuzz.imag))
                .p20(),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.BOTTOM,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    shopbuzz.name.text.xl4
                        .color(MyTheme.darkBluishColor)
                        .bold
                        .make(),
                    shopbuzz.desc.text
                        .textStyle(context.captionStyle)
                        .xl
                        .make(),
                    //"The iPhone 12 Pro has a 6.06 inch (154 mm) (marketed as 6.1-inch (15 cm)) OLED display with a resolution of 2532  1170 pixels (2.9 megapixels) at 460 PPI, while the iPhone 13 Pro Max has a 6.68 inch (170 mm) (marketed as 6.7-inch (17 cm)) OLED display with a resolution of 2778 x 1284 pixels"
                    // .text
                    // .make()
                    // .p16(),
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
