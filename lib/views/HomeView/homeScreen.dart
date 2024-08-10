import 'package:auvnet_internship/components/category_card.dart';
import 'package:auvnet_internship/consts/colors.dart';
import 'package:auvnet_internship/consts/reusewidgets.dart';
import 'package:auvnet_internship/views/HomeView/cubite/cubite.dart';
import 'package:auvnet_internship/views/HomeView/cubite/states.dart';
import 'package:auvnet_internship/views/cartview/cart.dart';

import 'package:auvnet_internship/views/cartview/cubite/cartCubite.dart';
import 'package:auvnet_internship/views/cartview/cubite/state.dart';
import 'package:auvnet_internship/views/catView/categoryView.dart';
import 'package:auvnet_internship/views/catView/cubite/cubite.dart';
import 'package:auvnet_internship/views/catView/cubite/states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "مرحبا بك ....",
          style: TextStyle(color: appColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(
              Icons.person_3_sharp,
              size: 26,
              color: appColor,
            ),
          ),
          BlocConsumer<Cartcubite, CartStates>(
            listener: (context, state) {},
            builder: (context, state) => GestureDetector(
              onTap: () {
                Cartcubite.get(context).readDataFromHive();
                NavigateTo(context, CartView());
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 18),
                child: Icon(
                  Icons.shopping_cart,
                  color: appColor,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocConsumer<HomeCubite, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) => HomeCubite.flag == true
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "الاقسام",
                          style: TextStyle(
                            color: appColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      BlocConsumer<ProductCubite, ProducttCategoryates>(
                        listener: (context, state) {},
                        builder: (context, state) => GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (_, index) => Category_card(
                              catInfo: HomeCubite.catInfo[index],
                              fn: () {
                                print(HomeCubite.catInfo[0].id);
                                ProductCubite.get(context).GetProduct(
                                    id: HomeCubite.catInfo[index].id);
                                NavigateTo(
                                    context,
                                    CategoryView(
                                      id: HomeCubite.catInfo[index].id,
                                      categoryName:
                                          HomeCubite.catInfo[index].CatName,
                                    ));
                              }),
                          itemCount: HomeCubite.catInfo.length,
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
