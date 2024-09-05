import 'package:e_commerce_app_api_sample/model/add_to_cart_screen_model/add_to_cart_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddToCartScreenController with ChangeNotifier {
  /// step 1 boxinta reference edthuu
  final cartbox = Hive.box<AddToCartScreenModel>('cartbox');
  List Cartkeys = [];

  /// step 2 aavsihyam ulla functions undakkii
  Future<void> addtocart(

      /// future void products details screenil .then   vilikan

      /// adhinta ellam value pass chythh kodthuu named parameter vechh
      {required String title,
      String? description,
      required String price,
      String? image,
      num? id,
      int qty = 1}) async {
    /// cartilkk orr item otta vattam hann add aavn paadu adhin ulla code
    bool alreadyInCart = false;

    for (var i = 0; i < Cartkeys.length; i++) {
      var itemInHive = cartbox.get(Cartkeys[i]);
      if (itemInHive?.id == id) {
        alreadyInCart = true;
      }
    }

    if (alreadyInCart == false) {
      /// box .add vech add to cart modelikk add cheyyan ulla variables elllam paranj kodthh
      await cartbox.add(AddToCartScreenModel(

          /// mela named parameter vecha pass chytha value ellam evda use chythuu
          title: title,
          price: price,
          description: description,
          image: image,
          id: id,
          qty: qty));
      Cartkeys = cartbox.keys.toList();
    } else {
      return print('already in caart');
    }
  }

  // removefromcart(var key) async {
  //   /// another method
  //  await cartbox.delete(key);
  //  Cartkeys = cartbox.keys.toList();
  //  notifyListeners();
  // after this call this function in add cart screenil removeil context.read vilich controller paranjj kodthitt index vech remove aaka
  // }

  incrementqty(var key) {
    /// another method to increment quantity

    // /// ellathiintam value kitan create chythaa variable
    // final ItemData = cartbox.get(key);

    // ///function used to increment qyt
    // cartbox.put(
    //     key,
    //     AddToCartScreenModel(
    //         title: ItemData!.title,
    //         price: ItemData.price,
    //         description: ItemData.description,
    //         id: ItemData.id,
    //         image: ItemData.image,
    //         qty: ++ItemData.qty));
    // after this add to cart screenil context.read vech addtocart screen controlleril.increment qty and value paranjj kodkka
    // notifyListeners();
  }

  decrementqty() {
    /// another method to decrement quantity

    // /// ellathiintam value kitan create chythaa variable
    // final ItemData = cartbox.get(key);

    // ///function used to increment qyt
    // cartbox.put(
    //     key,
    //     AddToCartScreenModel(
    //         title: ItemData!.title,
    //         price: ItemData.price,
    //         description: ItemData.description,
    //         id: ItemData.id,
    //         image: ItemData.image,
    //         qty: --ItemData.qty));
    // after this add to cart screenil context.read vech addtocart screen controlleril.decrement qty and value paranjj kodkka
    // notifyListeners();
  }

  getAllCartItems() {
    Cartkeys = cartbox.keys.toList();
    notifyListeners();
  }

  /// another way to get ietma
//  AddToCartScreenModel? getCurrentItems(var key){
//     final currentitems=cartbox.get(key);
//     return currentitems;
//  after this call this function in the add to cart pagil listviewbuildera consumer vech rap chytah adh vech ee functiona vilch items add aakam
//   }

  calculateTotalAmount() {}
}
