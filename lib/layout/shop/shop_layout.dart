import 'package:app/layout/shop/cubit/cubit.dart';
import 'package:app/layout/shop/cubit/states.dart';
import 'package:app/modules/shopApp/search/Shop_Search_Screen.dart';
import 'package:app/modules/shopApp/login/shop_login_screen.dart';
import 'package:app/shared/componants/constants.dart';
import 'package:app/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('salla'),
            actions: [
              IconButton(
                  onPressed: () {
                    navto(context, ShopSearchScreen());
                  },
                  icon: Icon(
                    Icons.search,
                  ))
            ],
          ),
          body: cubit.bottonNav[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              elevation: 20,
              onTap: ((index) {
                cubit.Changed(index);
              }),
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.apps), label: 'Catigores'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favorite'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ]),
        );
      },
    );
  }
}
