import 'package:app/layout/newsapp/cubit/cubit.dart';
import 'package:app/layout/newsapp/cubit/states.dart';

import 'package:app/shared/componants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/newsApp/seraech/seraech_screen.dart';


class Newslayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('NewsApp'),
            actions: [
              IconButton(
                  onPressed: () {
                    navto(context, SeraechScreen());
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    cubit.modechange();
                  },
                  icon: const Icon(Icons.brightness_6_outlined)),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.BottomNavBar(index);
              },
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItem),
        );
      },
    );
  }
}
