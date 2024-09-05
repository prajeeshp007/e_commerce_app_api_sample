import 'package:e_commerce_app_api_sample/controller/add_to_cart_screen_controller.dart';
import 'package:e_commerce_app_api_sample/controller/home_screen_controller.dart';
import 'package:e_commerce_app_api_sample/controller/product_details_screen_controller.dart';
import 'package:e_commerce_app_api_sample/model/add_to_cart_screen_model/add_to_cart_screen_model.dart';

import 'package:e_commerce_app_api_sample/view/bottom_/bottom_nav_screen.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter;

  /// code for regestering adapter
  Hive.registerAdapter(AddToCartScreenModelAdapter());

  var box = await Hive.openBox<AddToCartScreenModel>('cartbox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductDetailsScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddToCartScreenController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavScreen(),
      ),
    );
  }
}
