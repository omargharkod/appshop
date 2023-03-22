import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../layout/shop/shop_layout.dart';
import '../../../shared/componants/constants.dart';
import '../../../shared/componants/default_button_component.dart';
import '../../../shared/componants/default_field_component.dart';
import '../../../shared/network/local/cache_helper.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class RegisterScreen extends StatelessWidget {
  var emailcontroler = TextEditingController();
  var passcontroler = TextEditingController();
  var namecontroler = TextEditingController();
  var phonecontroler = TextEditingController();
  var fromkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit,ShopRegisterStates>(
        listener: (context, state) {

          if (state is ShopRegisterSucsses) {

            if (state.LoginModel.status == true) {
              Fluttertoast.showToast(
                  msg: state.LoginModel.message.toString(),
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
              CacheHelper.saveData(
                  key: 'token', value: state.LoginModel.data?.token);
              navAndfinish(context, const ShopLayout());
            } else {
              Fluttertoast.showToast(
                  msg: state.LoginModel.message.toString(),
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: fromkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 38,
                        ),
                        DefaultField(

                          controller: namecontroler,
                          text: 'Name',
                          type: TextInputType.text,
                          validator:(value){
                            if(value!.isEmpty){
                              return 'the name must not be empty';
                            }
                            return null;
                          },
                          pre: Icons.person,
                          onchanged: (s){
                            return null;
                          },
                          onTap: (){
                            return null;
                          },
                          onSubmet: (z){},

                        ),
                        SizedBox(
                          height: 20,
                        ),
                      DefaultField(
                          controller: emailcontroler,
                          text:  'email',
                          type: TextInputType.emailAddress,

                          validator:(value){
                            if(value!.isEmpty){
                              return 'the email must not be empty';
                            }
                            return null;
                          },
                          pre: Icons.email,
                          onchanged: (s){
                            return null;
                          },
                          onTap: (){
                            return null;
                          },
                          onSubmet: (z){},

                        ),
                        SizedBox(
                          height: 20,
                        ),

                        DefaultField(

                            text: 'password',
                            pre: Icons.lock,
                            suffix: Icons.remove_red_eye,
                            type: TextInputType.visiblePassword,
                            sufPressed:(){
                              ShopRegisterCubit.get(context).ChangepasswordSecure();
                            },
                            isPassword: ShopRegisterCubit.get(context).isPassword,
                            onchanged: (s){
                              return null;
                            },
                            onTap: (){
                              return null;
                            },
                            onSubmet: (z){},
                            controller: passcontroler,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'the password must not be empty';
                              }
                              return null;
                            }
                        ),SizedBox(
                          height: 20,
                        ),
                        DefaultField(

                          controller: phonecontroler,
                          text: 'phone',
                          type: TextInputType.phone,

                          validator:(value){
                            if(value!.isEmpty){
                              return 'the phone must not be empty';
                            }
                            return null;
                          },
                          pre: Icons.phone,
                          onchanged: (s){
                            return null;
                          },
                          onTap: (){
                            return null;
                          },
                          onSubmet: (z){},
                        ),
                        SizedBox(height: 25,),
                        DefaultButton(width: double.infinity, text: 'register', function: (){
                            if(fromkey.currentState!.validate()){
                              ShopRegisterCubit.get(context).userRegister(
                                  email: emailcontroler.text,
                                  password: passcontroler.text,
                                  name: namecontroler.text,
                                 phone: phonecontroler.text);

                            }
                          }, radius: 10,),

                        SizedBox(
                          height: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
