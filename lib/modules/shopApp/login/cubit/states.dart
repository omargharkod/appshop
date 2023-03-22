import 'package:app/models/shopapp/model_login.dart';

abstract class ShopLoginState {}

class ShopLoginInasialState extends ShopLoginState {}

class ShopLoginLoadingState extends ShopLoginState {}

class ShopLoginSuaccesState extends ShopLoginState {
  late final ShopLoginModel LoginModel;

  ShopLoginSuaccesState(this.LoginModel);
}

class ShopLoginErrorState extends ShopLoginState {}

class ShopLoginshowpassState extends ShopLoginState {}
