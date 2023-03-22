import 'package:app/models/shopapp/model_login.dart';

abstract class ShopRegisterStates{}
class ShopRegisterIntial extends ShopRegisterStates{}
class ShopRegisterSucsses extends ShopRegisterStates{
  final ShopLoginModel LoginModel;

  ShopRegisterSucsses(this.LoginModel);



}
class ShopRegisterError extends ShopRegisterStates{
  final String error;

  ShopRegisterError(this.error);
}
class ShopRegisterLoading extends ShopRegisterStates{}
class ShopRegisterSecure extends ShopRegisterStates{}
