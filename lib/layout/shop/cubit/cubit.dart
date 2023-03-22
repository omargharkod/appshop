import 'package:app/layout/shop/cubit/states.dart';
import 'package:app/models/shopapp/categories_model.dart';
import 'package:app/models/shopapp/home_model.dart';
import 'package:app/models/shopapp/model_login.dart';
import 'package:app/modules/shopApp/categories_screen.dart';
import 'package:app/modules/shopApp/favorites_screen.dart';
import 'package:app/modules/shopApp/product_screen.dart';
import 'package:app/modules/shopApp/settings_screen.dart';
import 'package:app/shared/componants/constants.dart';
import 'package:app/shared/network/end_points.dart';
import 'package:app/shared/network/local/cache_helper.dart';
import 'package:app/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/shopapp/changeFavouritsModel.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopIniailState());
  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottonNav = [
    ProductScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];
  void Changed(int index) {
    currentIndex = index;
    currentIndex = index;
    if (index == 0) {
      getHomeData();
    }
    if (index == 1) {
      getCategories();
    }
    // if (index == 2) {
    //   getScinence();
    // }
    emit(ShopChangeButtonNavState());
  }

  HomeModel? homeModel;
  Map<int, bool> favorite = {};

  void getHomeData() {
    emit(ShopLaodinghomeDataState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      homeModel!.data!.products.forEach((element) {
        favorite.addAll({element.id!: element.inFavorites!});
      });

      emit(ShopSucsesshomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorhomeDataState());
    });
  }

  CategoriesModel? categoriesModel;

  void getCategories() {
    DioHelper.getData(
      url: GET_categories,
      token: token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJason(value.data);

      emit(ShopSucsessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }
  ChangeFavouritsModel? changeFavouritsModel;
void changeFavorites(int productid) {
//   favorite[productid] =! favorite[productid]!;
//   emit(ShopSucsessChangeFavorietssState());
//   DioHelper.postData(
//     url: favorites,
//     data : {
//       "product_id" : productid
//     },
//     token: token,
//
//   ).then((value) {
//     emit(ShopSucsessChangeFavorietssState());
//       changeFavouritsModel = ChangeFavouritsModel.fromJson(value.data);
//       print(value.data);
//   if(changeFavouritsModel!.status!){
//     favorite[productid] =! favorite[productid]!;
//   }
//   }).catchError((error) {
//     print(error.toString());
// emit(ShopErrorChangeFavorietssState());
//
//
//   });
}
  ShopLoginModel? userData;

  void getUserData() {
    print("hiiii");
    emit(ShopLaodingUserDataState());
    DioHelper.getData(
      url: profile,
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {

      userData = ShopLoginModel.fromJason(value.data);

      emit(ShopSucsessUserDataState(userData!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }

}


