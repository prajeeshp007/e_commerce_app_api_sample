import 'package:e_commerce_app_api_sample/controller/add_to_cart_screen_controller.dart';
import 'package:e_commerce_app_api_sample/model/add_to_cart_screen_model/add_to_cart_screen_model.dart';
import 'package:e_commerce_app_api_sample/view/add_to_cart_page/add_cart_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class AddToCartPage extends StatefulWidget {
  const AddToCartPage({super.key});

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  final cartbox2 = Hive.box<AddToCartScreenModel>('cartbox');

  @override
  initState() {
    ///get all itemsill hann ella items ullath
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<AddToCartScreenController>().getAllCartItems();
      },
    );

    context.read<AddToCartScreenController>().getAllCartItems();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Favourites",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemBuilder: (context, index) {
              /// idh ahnn cartboxina get cheyyan ulla code
              final cartitems = context
                  .watch<AddToCartScreenController>()
                  .cartbox
                  .getAt(index);
              return AddCartWidget(
                onremove: () {
                  cartbox2.delete(cartbox2.keyAt(index));
                  setState(() {});
                },
                title: cartitems!.title,
                price: cartitems.price,
                qty: cartitems.qty.toString(),
                image: cartitems.image.toString(),
                onincrement: () {
                  cartbox2.putAt(
                      index, cartitems.copyWith(qty: cartitems.qty + 1));
                  setState(() {});
                },
                ondecrement: () {
                  if (cartitems.qty > 1) {
                    cartbox2.putAt(
                        index, cartitems.copyWith(qty: cartitems.qty - 1));
                    setState(() {});
                  }
                },
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemCount: cartbox2.keys.length,
          )),
    );
  }
}
