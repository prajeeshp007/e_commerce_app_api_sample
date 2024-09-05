import 'package:e_commerce_app_api_sample/controller/add_to_cart_screen_controller.dart';
import 'package:e_commerce_app_api_sample/controller/product_details_screen_controller.dart';
import 'package:e_commerce_app_api_sample/view/add_to_cart_page/add_to_cart_page.dart';
import 'package:e_commerce_app_api_sample/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class product_detail_screen extends StatefulWidget {
  const product_detail_screen({super.key, required this.product_id});

  final int product_id;

  @override
  State<product_detail_screen> createState() => _product_detail_screenState();
}

class _product_detail_screenState extends State<product_detail_screen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context
            .read<ProductDetailsScreenController>()
            .getproductdatas(product_id: widget.product_id.toString());
      },
    );
    super.initState();
  }

  // final String brandname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
          },
          child: Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: Center(
          child: Text(
            'Details',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 40),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddToCartPage(),
                    ));
              },
              icon: Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.black,
                size: 30,
              )),
          Stack(
            children: [
              Icon(
                Icons.notifications_none_sharp,
                color: Colors.black,
                size: 50,
              ),
              Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  child: Text(
                    '1',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.black,
                  radius: 10,
                ),
              )
            ],
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Consumer<ProductDetailsScreenController>(
            builder: (context, productdetailprovider, child) =>
                productdetailprovider.isloading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        child: Container(
                                          height: 500,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      productdetailprovider
                                                              .productdatalist
                                                              ?.image
                                                              .toString() ??
                                                          ''))),
                                        ),
                                      ),
                                      Positioned(
                                        top: 30,
                                        right: 40,
                                        child: Container(
                                          child: Icon(
                                            Icons.favorite_outline_outlined,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                      productdetailprovider
                                              .productdatalist?.title
                                              .toString() ??
                                          '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontSize: 40),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 1),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow.shade800,
                                          size: 30,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(),
                                          child: Text(
                                            ("Rating ${productdetailprovider.productdatalist?.rating!.rate.toString() ?? ''}"),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                fontSize: 20),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(),
                                          child: Text(
                                            'Only ${productdetailprovider.productdatalist?.rating!.count.toString() ?? ''} Left',
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(.9),
                                                fontSize: 17),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: Text(productdetailprovider
                                            .productdatalist?.description
                                            .toString() ??
                                        ""),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Choose Size',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Text(
                                            'S',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 30),
                                          ),
                                        ),
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.black),
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            'M',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 30),
                                          ),
                                        ),
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.black),
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            'L',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 30),
                                          ),
                                        ),
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.black),
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            'XL',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 30),
                                          ),
                                        ),
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.black),
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('price'),
                                  Text(
                                    productdetailprovider.productdatalist?.price
                                            .toString() ??
                                        '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: InkWell(
                                    onTap: () {
                                      context
                                          .read<AddToCartScreenController>()
                                          .addtocart(
                                              id: productdetailprovider
                                                  .productdatalist?.id,
                                              title: productdetailprovider
                                                      .productdatalist?.title
                                                      .toString() ??
                                                  '',
                                              price: productdetailprovider
                                                      .productdatalist?.price
                                                      .toString() ??
                                                  '0',
                                              description: productdetailprovider
                                                      .productdatalist
                                                      ?.description
                                                      .toString() ??
                                                  '',
                                              image: productdetailprovider
                                                      .productdatalist?.image
                                                      .toString() ??
                                                  '')
                                          .then(
                                        (value) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AddToCartPage(),
                                              ));
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.local_mall_outlined,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Add to cart',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
          )),
    );
  }
}
