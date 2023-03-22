import 'package:app/models/shopapp/model_login.dart';
import 'package:app/modules/shopApp/login/cubit/states.dart';
import 'package:app/modules/shopApp/register/cubit/states.dart';
import 'package:app/shared/network/end_points.dart';
import 'package:app/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates>{
  ShopRegisterCubit():super(ShopRegisterIntial());
  static ShopRegisterCubit get(context)=>BlocProvider.of(context);
  bool isPassword=true;
  static ShopLoginModel? loginModel;
  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }){
    emit(ShopRegisterLoading());
    DioHelper.postData(
      url: register,
      data: {
        'email':email,
        'password':password,
        'name':name,
        'phone':phone,
      },).then((value){
      print(value.data);
      loginModel=ShopLoginModel.fromJason(value.data);
      emit(ShopRegisterSucsses(loginModel!));
    }).catchError((error){
      emit(ShopRegisterError(error.toString()));
    });
  }
  void ChangepasswordSecure(){
    isPassword=!isPassword;
    emit(ShopRegisterSecure());
  }

}
