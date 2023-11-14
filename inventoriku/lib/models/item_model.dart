import 'package:flutter/material.dart';

class Item {
  String name;
  int amount;
  int price;
  String description;

  Item(this.name, this.amount, this.price, this.description);
}

class DataItem {
  static List<Item> data = [];
}
