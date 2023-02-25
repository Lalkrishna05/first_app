
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class ShopBuzzImage extends StatelessWidget {
  final String image;
  const ShopBuzzImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
    ).box.rounded.p8.white.make().p16().w40(context);
  }
}
