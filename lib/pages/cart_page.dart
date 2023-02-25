import 'package:first_app/models/ShopBuzz.dart';
import 'package:first_app/models/cart.dart';
import 'package:first_app/widgets/home_widgets/ShopBuzzList.dart';
import 'package:first_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:first_app/models/cart.dart';

import '../utils/routes.dart';

class cartpage extends StatelessWidget {
  const cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:
            "Cart".text.xl3.bold.color(MyTheme.darkBluishColor).center.make(),
      ),
      body: Column(
        children: [
          CartList().p32().expand(),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  final _cart = ShopBuzzModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalprice}".text.xl5.color(Colors.red).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.orderroute),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.darkBluishColor)),
            child: "Buy".text.white.bold.xl2.make(),
          ).w24(context).h4(context),
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => CartListState();
}

class CartListState extends State<CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ShopBuzzModel.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {
            _cart.remove(ShopBuzzModel.items[index]);
            setState(() {});
          },
        ),
        title: ShopBuzzModel.items[index].name.text.make(),
        //title: "item1".text.make(),
      ),
    );
  }
}
