import 'package:e_commerce_app_api_sample/controller/home_screen_controller.dart';
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
        await context.read<HomeScreenController>().getcategory();
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
            builder: (context, homeprovider, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        homeprovider.categorieslist.length,
                        (index) => DropdownMenuItem(
                            value: homeprovider.categorieslist[index],
                            child: Text(homeprovider.categorieslist[index]
                                .toUpperCase())),
                      ),
                      onChanged: (value) {
                        dropvalue = value as String?;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: homeprovider.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 400,
                          crossAxisSpacing: 30,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) => Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(homeprovider
                                              .products[index].image
                                              .toString())),
                                      shape: BoxShape.circle),
                                ),
                                Text(
                                  homeprovider.products[index].title.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.currency_bitcoin,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                    Text(
                                      homeprovider.products[index].price
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                              ],
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
