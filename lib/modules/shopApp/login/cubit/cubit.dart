import 'package:app/models/shopapp/model_login.dart';
import 'package:app/modules/shopApp/login/cubit/states.dart';
import 'package:app/shared/network/end_points.dart';
import 'package:app/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit() : super(ShopLoginInasialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      print('Suacces');
      var modelLogin = ShopLoginModel.fromJason(value.data);
      print(modelLogin.status);
      emit(ShopLoginSuaccesState(modelLogin));
    }).catchError((error) {
      print('error');
      emit(ShopLoginErrorState());
    });
  }

  IconData suffix = Icons.visibility_off;
  bool isPassword = true;
  void passVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopLoginshowpassState());
  }
}
