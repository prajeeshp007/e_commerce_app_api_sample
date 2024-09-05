import 'package:hive_flutter/adapters.dart';

/// step 5 part paranjj kodkka g. vech

/// step 6 part file add aakn ulla code terminalil run cheyya dart run build_runner build

part "add_to_cart_screen_model.g.dart";

/// step 3 hive type id paranjj kodkka
@HiveType(typeId: 0)

/// step 1 = orr a class create cheyya with variable and variable name
class AddToCartScreenModel {
  /// step 4 hive field with index create cheyya
  @HiveField(0)
  String title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String price;
  @HiveField(3)
  String? image;
  @HiveField(4)
  int qty;
  @HiveField(5)
  num? id;

  /// step 2 named parameter aaki value kodkka pass cheyyan ullath
  AddToCartScreenModel(
      {required this.title,
      this.description,
      required this.price,
      this.image,
      this.id,
      this.qty = 0});

  /// method create for increment and decrement qtyy of products

  AddToCartScreenModel copyWith({required int qty}) {
    return AddToCartScreenModel(
        title: title,
        description: description,
        price: price,
        id: id,
        image: image,
        qty: qty);
  }
}
