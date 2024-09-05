import 'dart:convert';

import 'package:e_commerce_app_api_sample/model/home_screen_model/get_all_products_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  /// variable used for categoriyil lodaing kodkann
  bool categoryisloading = false;

  /// variable for allproducts loading
  bool productsloading = false;

  /// evda all nn kodtath categoriesill All enn ullla option kanikkan hann
  /// variable for used to add #All in category
  List categorieslist = ["ALL"];

  /// variable used for all productsinta list vilikan
  List<AllProductsDataResModel> products = [];

  /// section for get all products
  ///
  ///
  Future<void> getAllproductdetails({String category = ''}) async {
    /// string category use chythath orooo categorina vilikan hann
    productsloading = true;
    notifyListeners();

    /// create two url one for all products and one for products category url
    final allurl = Uri.parse('https://fakestoreapi.com/products');
    final categoryurl =
        Uri.parse('https://fakestoreapi.com/products/category/$category');

    final url = category.isEmpty ? allurl : categoryurl;
    var responsedata = await http.get(url);
    print(responsedata.statusCode);
    print(responsedata.body);
    if (responsedata.statusCode == 200) {
      products = allProductsDataResModelFromJson(responsedata.body);
    }
    productsloading = false;
    notifyListeners();
  }

  /// section  to get category datas
  Future<void> getcategory() async {
    categoryisloading = true;
    notifyListeners();
    try {
      final url = Uri.parse('https://fakestoreapi.com/products/categories');
      var res = await http.get(url);

      if (res.statusCode == 200) {
        /// . add all vilichath all enn ullath categoriesil aadhym all kanikan hann adhin evda category list assign cheyyunathin pakaraam add all vech ALL enn ulla category add chyth
        categorieslist.addAll(jsonDecode(res.body));
        print(categorieslist);
      }
    } catch (e) {
      print(e);
    }
    categoryisloading = false;
    notifyListeners();
  }

  // oncategory(int index) {
  //   selectedcategorycolorindex = index;
  //   notifyListeners();
  // }
}
