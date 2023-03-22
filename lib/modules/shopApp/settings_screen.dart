import 'package:app/layout/shop/cubit/states.dart';
import 'package:app/shared/componants/constants.dart';
import 'package:app/shared/componants/default_button_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../layout/shop/cubit/cubit.dart';
import '../../shared/componants/default_field_component.dart';
import '../../shared/network/local/cache_helper.dart';
import 'login/shop_login_screen.dart';

class SettingsScreen extends StatelessWidget {

  var emailconroller = TextEditingController();
  var nameconroller = TextEditingController();
  var phoneconroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context, state) {
        if(state is ShopSucsessUserDataState){
        print("hiiiiiiiiii") ;
        }
      },
      builder: (context, state) {
        var model=ShopCubit.get(context).userData;
        nameconroller.text=model!.data!.name!;
        emailconroller.text=model.data!.email!;
        phoneconroller.text=model.data!.phone!;
       ShopCubit.get(context).userData!.data!.name;
        return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                DefaultField(
                    controller: nameconroller,
                    text: 'Name',
                    type: TextInputType.text,
                    validator: (value){
                      if(value!.isEmpty){
                        print('this field must not be empty');
                      }
                    },
                   pre: Icons.person),
                SizedBox(height: 15,),
                DefaultField(
                    controller: emailconroller,
                    text: 'Email',
                    type: TextInputType.text,
                    validator: (value){
                      if(value!.isEmpty){
                        print('this field must not be empty');
                      }
                    },
                    pre: Icons.email),
                SizedBox(height: 15,),
                DefaultField(
                    controller: phoneconroller,
                    text: 'Phone',
                    type: TextInputType.text,
                    validator: (value){
                      if(value!.isEmpty){
                        print('this field must not be empty');
                      }
                    },
                    pre: Icons.phone_android),
                SizedBox(height: 15,),
                DefaultButton(text: 'SIGNOUT', radius: 10, function:() {
                  CacheHelper.removeData(key: 'token');
                  navAndfinish(context, ShopLoginScreen());
                })
              ],
            ),


        );},
    );

  }
}
