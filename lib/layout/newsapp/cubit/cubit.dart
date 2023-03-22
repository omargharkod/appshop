import 'package:app/layout/newsapp/cubit/states.dart';

import 'package:app/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modules/newsApp/business/business_screen.dart';
import '../../../modules/newsApp/science/scinence_screen.dart';
import '../../../modules/newsApp/sports/sport_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInisalstate());

  static NewsCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  void modechange() {
    isDark = !isDark;
    emit(Newschangemodestate());
  }

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business_center), label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Sciences'),
  ];
  List<Widget> screens = [
    const Business(),
    const Sport(),
    const Scinence(),
  ];
  void BottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) {
      getBusiness();
    }
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScinence();
    }
    emit(NewsBotNavstate());
  }

  List<dynamic> business = [];
  void getBusiness() {
    DioHelper.getData(
      url:
          '/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca',
      //  'v2/top-headlines', query: {
      //   'country': 'eg',
      //   'category': 'business',
      //   'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      // }
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusSussesstate());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusErrortate());
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    DioHelper.getData(
      url:
          'v2/top-headlines?country=eg&category=sports&apiKey=65f7f556ec76449fa7dc7c0069f040ca',
    ).then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportSussesstate());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportErrortate());
    });
  }

  List<dynamic> scinence = [];
  void getScinence() {
    DioHelper.getData(
      url:
          'v2/top-headlines?country=eg&category=science&apiKey=65f7f556ec76449fa7dc7c0069f040ca',
    ).then((value) {
      scinence = value.data['articles'];
      print(scinence[0]['title']);
      emit(NewsGetSciSussesstate());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSciErrortate());
    });
  }

  List<dynamic> seraech = [];
  void getseraech(String value) {
    seraech = [];
    DioHelper.getData(
      url:
          'https://newsapi.org/v2/everything?q=$value&apiKey=65f7f556ec76449fa7dc7c0069f040ca',
    ).then((value) {
      seraech = value.data['articles'];
      print(seraech[0]['title']);
      emit(NewssearchSussesstate());
    }).catchError((error) {
      print(error.toString());
      emit(NewssearchErrortate());
    });
  }
}
