import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ShopBuzzModel {
  static var items = [
    Item(
        id: 1,
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th generation",
        price: 999,
        color: "#33505a",
        imag: "assets/iphone12pro.jpg"),
    Item(
        id: 2,
        name: "Pixel 5",
        desc: "Google Pixel phone 5th generation",
        price: 699,
        color: "#00ac51",
        imag: "assets/mac.jpg"),
    Item(
        id: 3,
        name: " playstation 5",
        desc: "sony playstation 5th generation",
        price: 500,
        color: "#544ee4",
        imag: "assets/ps5.jpeg"),
    Item(
        id: 4,
        name: "Airpods Pro",
        desc: "Airpodes Pro first generation",
        price: 200,
        color: "#e3e4e9",
        imag: "assets/airpod.jpg"),
    Item(
        id: 5,
        name: " Ipad Pro",
        desc: "Apple iPad Pro 2020 edition",
        price: 799,
        color: "#f73984",
        imag: "assets/ipadpro.jpeg"),
    Item(
        id: 6,
        name: "samsung galaxy s21 ultra",
        desc: "samsung galaxy s21 ultra 2021 edition",
        price: 1299,
        color: "#1c1c1c",
        imag: "assets/s21-ultra.jpg"),
    Item(
        id: 7,
        name: "vivo x80 pro",
        desc: "vivo x80 pro 2021 edition",
        price: 750,
        color: "#1c1c1c",
        imag: "assets/x80pro.jpeg"),
    Item(
        id: 8,
        name: "Oneplus Nord 2 5g",
        desc: "Oneplus Nord 2 oxygen os",
        price: 450,
        color: "#1c1c1c",
        imag: "assets/nord2.jpeg"),
    Item(
        id: 9,
        name: "Oneplus 10 pro 5g",
        desc: "Oneplus 10 pro 2023 edition",
        price: 850,
        color: "#1c1c1c",
        imag: "assets/op10pro.jpeg"),
    Item(
        id: 10,
        name: "Google pixel 7 pro 5g",
        desc: "Google pixel 7 pro 2022 edition",
        price: 850,
        color: "#1c1c1c",
        imag: "assets/pixel7pro.jpeg"),
  ];

  static final catModel = ShopBuzzModel._internal;
  ShopBuzzModel._internal();
  factory ShopBuzzModel() => catModel();
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);
  Item getbyposition(int pos) => items[pos];
  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imag;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.imag});

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? imag,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      imag: imag ?? this.imag,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'imag': imag,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      color: map['color'],
      imag: map['imag'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, imag: $imag)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.imag == imag;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        imag.hashCode;
  }
}
