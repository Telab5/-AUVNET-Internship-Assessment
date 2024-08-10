import 'package:auvnet_internship/components/defultBtn.dart';
import 'package:auvnet_internship/views/cartview/cubite/cartCubite.dart';
import 'package:auvnet_internship/views/cartview/cubite/state.dart';
import 'package:auvnet_internship/views/product_detils/cubite/cubite.dart';
import 'package:auvnet_internship/views/product_detils/cubite/state.dart';
import 'package:auvnet_internship/views/HomeView/cubite/cubite.dart';
import 'package:auvnet_internship/views/catView/cubite/cubite.dart';
import 'package:auvnet_internship/views/catView/cubite/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Proddetials extends StatelessWidget {
  Proddetials({super.key, required this.id});
  dynamic? id;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<ProductCubite, ProducttCategoryates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(ProductCubite.get(context).ListofProduct[id].name),
          ),
          body: BlocConsumer<DetailsCubite, DetailsState>(
            listener: (context, state) {},
            builder: (context, state) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 400,
                          width: 250,
                          child: Image.network(ProductCubite.get(context)
                              .ListofProduct[id]
                              .image),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () => DetailsCubite.get(context).Increment(),
                            child: CircleAvatar(child: Icon(Icons.add))),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Text(
                            DetailsCubite.get(context).count.toString(),
                            style: TextStyle(fontSize: 36),
                          ),
                        ),
                        GestureDetector(
                            onTap: () => DetailsCubite.get(context).decrement(),
                            child: CircleAvatar(child: Icon(Icons.remove))),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          " سعر الوحده بعد الخصم : ${ProductCubite.get(context).ListofProduct[id].price}",
                          style: TextStyle(fontSize: 26),
                        )
                      ],
                    ),
                    ProductCubite.get(context).ListofProduct[id].discount != 0
                        ? Row(
                            children: [
                              Text(
                                "خصم: ${ProductCubite.get(context).ListofProduct[id].discount.toString()}",
                                style: TextStyle(fontSize: 26),
                              )
                            ],
                          )
                        : Text(" "),
                    DetailsCubite.get(context).count > 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  style: TextStyle(fontSize: 24),
                                  "الاجمالي : ${DetailsCubite.get(context).count * ProductCubite.get(context).ListofProduct[id].price}"),
                              BlocConsumer<Cartcubite, CartStates>(
                                listener: (context, state) {},
                                builder: (context, state) => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    defultBtn(
                                        Txt: "اضف الي السله",
                                        fn: () {
                                          Cartcubite.get(context)
                                              .uploadCartWithHive(
                                            context: context,
                                            id: ProductCubite.get(context)
                                                .ListofProduct[id]
                                                .id,
                                            count: DetailsCubite.get(context)
                                                .count,
                                          );
                                        }),
                                  ],
                                ),
                              )
                            ],
                          )
                        : Text(""),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      ProductCubite.get(context).ListofProduct[id].disc,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
