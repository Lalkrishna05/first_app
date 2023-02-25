// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


import '../../models/ShopBuzz.dart';
import '../../pages/home_detail_page.dart';
import '../themes.dart';
import 'ShopBuzzImage.dart';

class shopbuzzlist extends StatelessWidget {
  const shopbuzzlist({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ShopBuzzModel.items.length,
      itemBuilder: (context, index) {
        final shopbuzz = ShopBuzzModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                shopbuzz: shopbuzz,
              ),
            ),
          ),
          child: ShopBuzzItem(shopbuzz: shopbuzz),
        );
      },
    );
  }
}

class ShopBuzzItem extends StatelessWidget {
  final Item shopbuzz;
  const ShopBuzzItem({
    Key? key,
    required this.shopbuzz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(shopbuzz.id.toString()),
            child: ShopBuzzImage(image: shopbuzz.imag),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              shopbuzz.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              shopbuzz.desc.text.textStyle(context.captionStyle).make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${shopbuzz.price}".text.bold.make(),
                  addtocart(
                    shopbuzz: shopbuzz,
                  ),
                ],
              )
            ],
          ).pOnly(right: 8.0))
        ],
      ),
    ).blue100.rounded.square(170).make().py16();
  }
}

class addtocart extends StatefulWidget {
  final Item shopbuzz;
  const addtocart({
    Key? key,
    required this.shopbuzz,
  }) : super(key: key);
  @override
  State<addtocart> createState() => _addtocartState();
}

class _addtocartState extends State<addtocart> {


  @override
  Widget build(BuildContext context) {
    bool isadded = false;
    return ElevatedButton(
      onPressed: () {
        isadded = isadded.toggle();
        setState(() {});
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            MyTheme.darkBluishColor,
          ),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: "Add to Cart".text.make(),
    );
  }
}
