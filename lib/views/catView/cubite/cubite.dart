import 'package:auvnet_internship/consts/apiEndPoints.dart';
import 'package:auvnet_internship/consts/apiLink.dart';

import 'package:auvnet_internship/models/productModel.dart';
import 'package:auvnet_internship/services/DioHellper.dart';
import 'package:auvnet_internship/views/catView/cubite/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubite extends Cubit<ProducttCategoryates> {
  ProductCubite() : super(initialProductCategorystate());
  static ProductCubite get(context) => BlocProvider.of(context);
  List<ProductModeL> ListofProduct = [];
  dynamic? list;
  void GetProduct({id}) {
    emit(LoadingCategoryProducttate());
    Diohellper.getData(baseUrl + Category + id.toString()).then((val) {
      list = val.data['data']['data'];
      ListofProduct = [];
      for (var item in list) {
        ListofProduct.add(ProductModeL(
            id: item['id'],
            discount: item['discount'],
            image: item['image'],
            in_cart: item['in_cart'],
            in_favorites: item['in_favorites'],
            name: item['name'],
            old_price: item['old_price'],
            disc: item['description'],
            price: item['price']));
      }
      print(ListofProduct);
      emit(GetDataSucseesProductcategorytate());
    });
  }
}
