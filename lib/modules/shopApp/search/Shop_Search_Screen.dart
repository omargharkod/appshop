import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/componants/constants.dart';
import '../../../shared/componants/default_field_component.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ShopSearchScreen extends StatelessWidget {
  const ShopSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey=GlobalKey<FormState>();
    var seachController=TextEditingController();
    return BlocProvider(
      create: (context)=>SearchCubit(),
      child: BlocConsumer<SearchCubit,SearchStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children:
                  [
                    DefaultField(
                      controller: seachController,
                      text: 'search',
                      type: TextInputType.text,
                      validator: (value){
                        if(value!.isEmpty){
                          print('Search must not be empty');
                        }
                      },
                      pre: Icons.search,
                      onSubmet: (String text){
                        SearchCubit.get(context).Search(text);
                      },
                      onTap: (){},
                        onchanged: (x){
                        return null;
                      },

                    ),
                    SizedBox(height: 10,),
                    if(state is SearchLoadingStates)
                      LinearProgressIndicator(),
                    SizedBox(height: 13,),
                    if(state is SearchSuccesslStates)
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => buildFavItem(SearchCubit.get(context).searchModel!.data!.data![index],context),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount: SearchCubit.get(context).searchModel!.data!.data!.length,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


