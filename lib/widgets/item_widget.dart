import 'package:first_app/models/ShopBuzz.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item}) : assert(item != null);
  final Item item;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        leading: Image.asset(item.imag),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
