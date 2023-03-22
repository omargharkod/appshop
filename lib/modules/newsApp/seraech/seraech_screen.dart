import 'package:app/layout/newsapp/cubit/cubit.dart';
import 'package:app/layout/newsapp/cubit/states.dart';
import 'package:app/shared/componants/constants.dart';
import 'package:app/shared/componants/default_field_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeraechScreen extends StatelessWidget {
  var seraechcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).seraech;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DefaultField(
                    controller: seraechcontroller,
                    type: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'the seraech must be empty';
                      }
                      return null;
                    },
                    onchanged: (value) {
                      NewsCubit.get(context).getseraech(value);
                    },
                    text: 'seraech',
                    pre: Icons.search_outlined),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      buildArticleItem(context, List),
                  separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                  itemCount: 10,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
