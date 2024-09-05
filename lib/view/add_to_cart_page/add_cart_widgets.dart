import 'package:flutter/material.dart';

class AddCartWidget extends StatelessWidget {
  const AddCartWidget({
    super.key,
    required this.title,
    this.desc,
    required this.qty,
    this.onincrement,
    this.ondecrement,
    this.onremove,
    required this.image,
    required this.price,
  });
  final String title;
  final String? desc;
  final String price;
  final String image;
  final String qty;
  final VoidCallback? onincrement;
  final VoidCallback? ondecrement;
  final VoidCallback? onremove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.black),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    fit: BoxFit.cover, height: 150, width: 100, image),
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    "${title}",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    price,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: onincrement,
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                  Text(
                    qty,
                    style: TextStyle(color: Colors.amber),
                  ),
                  TextButton(
                      onPressed: ondecrement,
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ))
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              child: TextButton(
                  onPressed: onremove,
                  child: Text(
                    "Remove",
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  )))
        ],
      ),
    );
  }
}
