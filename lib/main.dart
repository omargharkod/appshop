import 'package:app/layout/newsapp/cubit/cubit.dart';
import 'package:app/layout/newsapp/cubit/states.dart';
import 'package:app/layout/shop/cubit/cubit.dart';
import 'package:app/layout/shop/shop_layout.dart';
import 'package:app/modules/shopApp/login/shop_login_screen.dart';
import 'package:app/modules/shopApp/on_banding_screen.dart';
import 'package:app/shared/network/local/cache_helper.dart';
import 'package:app/shared/network/remote/dio_helper.dart';
import 'package:app/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Widget? widget;
  var onboading = CacheHelper.getData(key: 'onboading');
  print(onboading);
  var token = CacheHelper.getData(key: 'token');
  print(token);
  if (onboading != null) {
    if (token != null) {
      widget = ShopLayout();
    } else {
      widget = ShopLoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }
  runApp(MyApp(
    startWidget: widget,
    onboading: onboading,
  ));
}

class MyApp extends StatelessWidget {
  final bool? onboading;
  final Widget? startWidget;
  const MyApp({
    super.key,
    this.onboading,
    this.startWidget,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context) => NewsCubit()..getBusiness()),
          BlocProvider(
              create: (BuildContext context) => ShopCubit()
                ..getHomeData()
                ..getCategories()..getUserData()),
        ],
        child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: NewsCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: startWidget,
            );
          },
        ));
  }
}
