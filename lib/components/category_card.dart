import 'package:auvnet_internship/consts/colors.dart';
import 'package:auvnet_internship/models/categoryModel.dart';
import 'package:flutter/material.dart';

class Category_card extends StatelessWidget {
  Category_card({super.key, required this.catInfo, required this.fn});
  Categorymodel catInfo;
  VoidCallback fn;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fn,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Stack(
            children: [
              Center(
                  child: Image.network(
                catInfo.ImageUrl,
                width: 75,
              )),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    catInfo.CatName,
                    style:
                        TextStyle(color: appColor, fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
                bottom: BorderSide(color: appColor),
                left: BorderSide(color: appColor)),
            borderRadius: BorderRadius.circular(16),
          ),
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
