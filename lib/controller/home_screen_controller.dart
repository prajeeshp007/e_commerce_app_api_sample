import 'dart:convert';

import 'package:e_commerce_app_api_sample/model/home_screen_model/get_all_products_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  /// evda all nn kodtath categoriesill All enn ullla option kanikkan hann
  List categorieslist = ["ALL"];
  List<AllProductsDataResModel> products = [];
  int selectedcategorycolorindex = 0;

  Future<void> getAllproductdetails() async {
    final url = Uri.parse('https://fakestoreapi.com/products');
    var responsedata = await http.get(url);
    print(responsedata.statusCode);
    print(responsedata.body);
    if (responsedata.statusCode == 200) {
      products = allProductsDataResModelFromJson(responsedata.body);
    }
    notifyListeners();
  }

  /// to get category datas
  Future<void> getcategory() async {
    try {
      final url = Uri.parse('https://fakestoreapi.com/products/categories');
      var res = await http.get(url);

      if (res.statusCode == 200) {
        /// . add all vilichath all enn ullath categoriesil aadhym all kanikan hann
        categorieslist.addAll(jsonDecode(res.body));
        print(categorieslist);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  oncategory(int index) {
    selectedcategorycolorindex = index;
    notifyListeners();
  }
}
