import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../layout/newsapp/cubit/cubit.dart';
import '../../../layout/newsapp/cubit/states.dart';
import '../../../shared/componants/constants.dart';

class Scinence extends StatelessWidget {
  const Scinence({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).scinence;
          return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildArticleItem(list[index], context),
              separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
              itemCount: 10);
        });
  }
}
