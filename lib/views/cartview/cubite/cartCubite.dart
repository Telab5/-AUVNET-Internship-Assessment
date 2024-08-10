import 'package:auvnet_internship/consts/apiEndPoints.dart';
import 'package:auvnet_internship/models/cartModel.dart';
import 'package:auvnet_internship/models/productModel.dart';
import 'package:auvnet_internship/services/DioHellper.dart';
import 'package:auvnet_internship/views/cartview/cubite/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class Cartcubite extends Cubit<CartStates> {
  Cartcubite() : super(initCartState());

  static Cartcubite get(context) => BlocProvider.of(context);
  final Box box = Hive.box('Cart');
  static List<Cartmodel> cart = [];
  static List<ProductModeL> cartData = [];

  void uploadCartWithHive(
      {required int id, required int count, required BuildContext context}) {
    emit(LoadingCartState());

    box.add({'id': id, 'count': count}).then((_) {
      Navigator.pop(context);
      emit(SuccessUploadCartState());
    }).catchError((error) {
      emit(FailedUploadCartState());
    });
  }

  void readDataFromHive() {
    cart.clear();
    emit(LoadingCartState());

    final List<dynamic> hiveData = Hive.box('Cart').values.toList();
    for (var item in hiveData) {
      cart.add(Cartmodel(id: item['id'], count: item['count']));
      getDataCart(item['id']);
    }
    emit(SuccessUploadCartState());
  }

  void getDataCart(int id) {
    Diohellper.PostData(url: Product, data: {'id': id}).then((value) {
      dynamic v = value.data['data']['data'];

      for (dynamic x in v) {
        cartData.add(ProductModeL(
            id: x['id'],
            discount: x['discount'],
            image: x['image'],
            in_cart: x['in_cart'],
            in_favorites: x['in_favorites'],
            name: x['name'],
            old_price: x['old_price'],
            price: x['price'],
            disc: x['disc']));
      }

      // print(v['id']);
    }).catchError((error) {
      emit(FailedUploadCartState());
    });
  }
}
