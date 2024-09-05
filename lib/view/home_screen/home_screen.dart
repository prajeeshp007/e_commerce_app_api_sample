import 'package:e_commerce_app_api_sample/controller/home_screen_controller.dart';
import 'package:e_commerce_app_api_sample/view/products_details_screen/products_details_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<String> dropdwnitems = [
  //   'ALL'
  //   // 'Furniture',
  //   // "Jewellery",
  //   // "Electronics",
  //   // "Clothing",
  // ];
  String? dropvalue;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        ///one for category calling
        await context.read<HomeScreenController>().getcategory();

        /// one for all products
        await context.read<HomeScreenController>().getAllproductdetails();
        // setState(() {
        //   dropdwnitems.addAll(context
        //       .read<HomeScreenController>()
        //       .categorieslist as Iterable<String>);
        // });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal, // Background color
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "GOOD MORNING,",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Consumer<HomeScreenController>(
            builder: (context, homeprovider, child) => homeprovider
                    .categoryisloading

                /// for category load cheyyumboo loading kanikan ee loading kanicha shesham hann category section kanikku
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          DropdownButton(
                            /// evda drop down value empty hanalll all enn ullath aaadhym kanikmm
                            value: dropvalue ?? 'ALL',
                            items: List.generate(
                              /// lengt kodukan ulla code
                              /// evda toset.tolist vilikan ulla karanm duplicates value ellam ozhivakum
                              homeprovider.categorieslist
                                  .toSet()
                                  .toList()
                                  .length,
                              (index) => DropdownMenuItem(
                                  value: homeprovider.categorieslist[index],
                                  child: Text(homeprovider.categorieslist[index]
                                      .toUpperCase())),
                            ),
                            onChanged: (value) {
                              context
                                  .read<HomeScreenController>()
                                  .getAllproductdetails(
                                      category: value.toString());
                              dropvalue = value as String?;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Expanded(
                        child: homeprovider.productsloading

                            /// for product load cheyyunna tymil lodaing indicator kanikan category load chyth kazhinn product kanikumbo loaing varan
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : GridView.builder(
                                itemCount: homeprovider.products.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: 300,
                                        crossAxisSpacing: 20,
                                        crossAxisCount: 2),
                                itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  product_detail_screen(
                                                product_id: homeprovider
                                                    .products[index].id!,
                                              ),
                                            ));
                                      },
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 200,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          homeprovider
                                                              .products[index]
                                                              .image
                                                              .toString())),
                                                  shape: BoxShape.circle),
                                            ),
                                            Text(
                                              maxLines: 1,
                                              homeprovider.products[index].title
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.attach_money_rounded,
                                                  color: Colors.black,
                                                  size: 30,
                                                ),
                                                Text(
                                                  homeprovider
                                                      .products[index].price
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
