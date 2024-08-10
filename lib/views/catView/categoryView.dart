import 'package:auvnet_internship/components/ProductCard.dart';

import 'package:auvnet_internship/views/catView/cubite/cubite.dart';
import 'package:auvnet_internship/views/catView/cubite/states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key, required this.id, required this.categoryName});
  int? id;
  String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: BlocConsumer<ProductCubite, ProducttCategoryates>(
        listener: (context, state) {},
        builder: (context, state) => state is LoadingCategoryProducttate
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (context, index) => ProductCard(
                  product: ProductCubite.get(context).ListofProduct[index],
                  idx: index,
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
                itemCount: ProductCubite.get(context).ListofProduct.length,
              ),
      ),
    );
  }
}
