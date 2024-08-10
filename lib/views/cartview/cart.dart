// import 'package:auvnet_internship/components/defultBtn.dart';
// import 'package:auvnet_internship/consts/colors.dart';
// import 'package:auvnet_internship/consts/reusewidgets.dart';
// import 'package:auvnet_internship/models/cartModel.dart';
// import 'package:auvnet_internship/models/productModel.dart';
// import 'package:auvnet_internship/views/cartview/cubite/cartCubite.dart';
// import 'package:auvnet_internship/views/cartview/cubite/state.dart';
// import 'package:auvnet_internship/views/catView/cubite/cubite.dart';
// import 'package:auvnet_internship/views/product_detils/cubite/cubite.dart';
// import 'package:auvnet_internship/views/product_detils/cubite/state.dart';
// import 'package:auvnet_internship/views/product_detils/prodDetials.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CartView extends StatelessWidget {
//   CartView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cart"),
//       ),
//       body: BlocConsumer<Cartcubite, CartStates>(
//         listener: (context, state) {},
//         builder: (context, state) => false == false
//             ? ListView.separated(
//                 itemCount: 0,
//                 itemBuilder: (context, index) => CartItem(
//                   product: Cartcubite.get(context).cartData[index],
//                 ),
//                 separatorBuilder: (context, index) => SizedBox(
//                   height: 15,
//                 ),
//               )
//             : Text("data"),
//       ),
//     );
//   }
// }

// class CartItem extends StatelessWidget {
//   CartItem({
//     super.key,
//     required this.product,
//   });

//   ProductModeL product;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Row(
//           children: [
//             Container(
//               width: 75,
//               child: Image.network(
//                 product.image,
//                 height: 50,
//               ),
//             ),
//             Column(
//               children: [
//                 Container(
//                   width: 150,
//                   child: Text(
//                     product.name,
//                     style: TextStyle(
//                         color: appColor,
//                         fontWeight: FontWeight.bold,
//                         overflow: TextOverflow.ellipsis),
//                   ),
//                 ),
//                 Text(product.price.toString(),
//                     style: TextStyle(color: Colors.grey)),
//               ],
//             )
//           ],
//         ),
//         BlocConsumer<DetailsCubite, DetailsState>(
//           listener: (context, state) {},
//           builder: (context, state) => Align(
//             alignment: Alignment.center,
//             child: Padding(
//                 padding: const EdgeInsets.only(right: 0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                             onTap: () => DetailsCubite.get(context).Increment(),
//                             child: CircleAvatar(child: Icon(Icons.add))),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 18.0),
//                           child: Text(
//                             DetailsCubite.get(context).count.toString(),
//                             style: TextStyle(fontSize: 36),
//                           ),
//                         ),
//                         GestureDetector(
//                             onTap: () => DetailsCubite.get(context).decrement(),
//                             child: CircleAvatar(child: Icon(Icons.remove))),
//                       ],
//                     ),
//                   ],
//                 )),
//           ),
//         )
//       ],
//     );
//   }
// }

import 'package:auvnet_internship/components/defultBtn.dart';
import 'package:auvnet_internship/consts/colors.dart';
import 'package:auvnet_internship/consts/reusewidgets.dart';
import 'package:auvnet_internship/models/cartModel.dart';
import 'package:auvnet_internship/models/productModel.dart';
import 'package:auvnet_internship/views/cartview/cubite/cartCubite.dart';
import 'package:auvnet_internship/views/cartview/cubite/state.dart';
import 'package:auvnet_internship/views/product_detils/cubite/cubite.dart';
import 'package:auvnet_internship/views/product_detils/cubite/state.dart';
import 'package:auvnet_internship/views/product_detils/prodDetials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: BlocConsumer<Cartcubite, CartStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cartData = Cartcubite.cartData;

          if (state is LoadingCartState) {
            return Center(child: CircularProgressIndicator());
          }

          if (cartData.isEmpty) {
            return Center(child: Text("Your cart is empty"));
          }

          return ListView.separated(
            itemCount: cartData.length,
            itemBuilder: (context, index) => CartItem(
              product: cartData[index],
            ),
            separatorBuilder: (context, index) => SizedBox(height: 15),
          );
        },
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final ProductModeL product;

  CartItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Container(
              width: 75,
              child: Image.network(
                product.image,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      color: appColor,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    product.price.toString(),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        BlocConsumer<DetailsCubite, DetailsState>(
          listener: (context, state) {},
          builder: (context, state) => Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => DetailsCubite.get(context).Increment(),
                    child: CircleAvatar(child: Icon(Icons.add)),
                  ),
                  SizedBox(width: 18),
                  Text(
                    DetailsCubite.get(context).count.toString(),
                    style: TextStyle(fontSize: 36),
                  ),
                  SizedBox(width: 18),
                  GestureDetector(
                    onTap: () => DetailsCubite.get(context).decrement(),
                    child: CircleAvatar(child: Icon(Icons.remove)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
