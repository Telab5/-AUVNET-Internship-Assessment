import 'package:auvnet_internship/views/product_detils/cubite/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCubite extends Cubit<DetailsState> {
  DetailsCubite() : super(initDetails());
  static DetailsCubite get(context) => BlocProvider.of(context);
  int count = 0;
  void Increment() {
    count++;
    emit(IncremetStateDetails());
  }

  void decrement() {
    if (count == 0) {
      count++;
    }
    count--;
    emit(DecrementStateDetails());
  }
}
