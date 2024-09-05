import 'package:e_commerce_app_api_sample/model/product_details_screen_model/product_details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductDetailsScreenController with ChangeNotifier {
  ProductsListDataResModel? productdatalist;
  bool isloading = false;
  Future<void> getproductdatas({required String product_id}) async {
    isloading = true;
    notifyListeners();
    final url = Uri.parse('https://fakestoreapi.com/products/$product_id');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      productdatalist = productsListDataResModelFromJson(response.body);
    }
    isloading = false;
    notifyListeners();
  }
}
