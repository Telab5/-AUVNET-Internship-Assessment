import 'package:auvnet_internship/consts/apiEndPoints.dart';
import 'package:auvnet_internship/services/DioHellper.dart';
import 'package:auvnet_internship/views/loginview/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubite extends Cubit<LoginStates> {
  LoginCubite() : super(InitaialLoginState());

  static LoginCubite get(context) => BlocProvider.of(context);
  void userLogin({
    required email,
    required password,
  }) {
    emit(LoadingLoginState());
    Diohellper.PostData(
      url: LOGIN,
      data: {'email': email, 'password': password},
    ).then((value) {
      print(value.data.toString());
      emit(SucessLoginState());
    }).catchError((error) {
      print(error.toString());
      emit(FalledLoginState(error: error.toString()));
    });
  }
}
