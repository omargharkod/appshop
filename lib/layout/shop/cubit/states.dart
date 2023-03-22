import '../../../models/shopapp/model_login.dart';

class ShopState {}

class ShopIniailState extends ShopState {}

class ShopChangeButtonNavState extends ShopState {}

class ShopLaodinghomeDataState extends ShopState {}

class ShopSucsesshomeDataState extends ShopState {}

class ShopErrorhomeDataState extends ShopState {}

class ShopSucsessCategoriesState extends ShopState {}

class ShopErrorCategoriesState extends ShopState {}

class ShopSucsessChangeFavorietssState extends ShopState {}

class ShopErrorChangeFavorietssState extends ShopState {}

class ShopLaodingUserDataState extends ShopState {}

class ShopSucsessUserDataState extends ShopState {
  late final ShopLoginModel LoginModel;

  ShopSucsessUserDataState(this.LoginModel);
}

class ShopErrorUserDataState extends ShopState {}
