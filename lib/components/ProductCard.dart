import 'package:auvnet_internship/components/defultBtn.dart';
import 'package:auvnet_internship/consts/colors.dart';
import 'package:auvnet_internship/consts/reusewidgets.dart';
import 'package:auvnet_internship/models/productModel.dart';

import 'package:flutter/material.dart';

import '../views/product_detils/prodDetials.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    super.key,
    required this.product,
    required this.idx,
  });
  int idx;
  ProductModeL product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: 75,
                child: Image.network(
                  product.image,
                  height: 50,
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 150,
                    child: Text(
                      product.name,
                      style: TextStyle(
                          color: appColor,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Text(product.price.toString(),
                      style: TextStyle(color: Colors.grey)),
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: defultBtn(
                fn: () {
                  NavigateTo(context, Proddetials(id: idx));
                },
                Txt: "عرض المنتج",
                width: 100,
              ),
            ),
          )
        ],
      ),
    );
  }
}
