import 'package:first_app/models/ShopBuzz.dart';

class CartModel {
  static final cartModel = CartModel._internal;
  CartModel._internal();
  factory CartModel() => cartModel();

  late ShopBuzzModel shopbuzz;

  final List<int> _itemIds = []; 
  ShopBuzzModel get Shopbuzz => shopbuzz;
  set Shopbuzz(ShopBuzzModel newshopbuzz) {
    assert(newshopbuzz != null);
    shopbuzz = newshopbuzz;
  }

  //get items in the cart
  List<Item> get items => _itemIds.map((id) => shopbuzz.getById(id)).toList();

  //get total price
  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
}

  }