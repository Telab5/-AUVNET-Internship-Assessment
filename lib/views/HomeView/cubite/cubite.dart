import 'package:auvnet_internship/consts/apiLink.dart';
import 'package:auvnet_internship/models/categoryModel.dart';
import 'package:auvnet_internship/services/DioHellper.dart';
import 'package:auvnet_internship/views/HomeView/cubite/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubite extends Cubit<HomeStates> {
  HomeCubite() : super(initialHomeState());
  static HomeCubite get(context) => BlocProvider.of(context)..GetCategory();
  static List<Categorymodel> catInfo = [];
  static List<dynamic> Categories = [];
  static dynamic flag = false;

  void GetCategory() {
    emit(LoadingHomeState());

    Diohellper.getData(baseUrl + 'categories').then((value) {
      Categories = value.data['data']['data'];
      catInfo = [];
      for (dynamic cat in Categories) {
        catInfo.add(Categorymodel(
            CatName: cat['name'], ImageUrl: cat['image'], id: cat['id']));
        print(cat['name']);
      }
      print(catInfo.length);
      flag = true;
      emit(GetDataSucseesHomeState());
    });
  }
}
