import 'package:app/layout/shop/shop_layout.dart';
import 'package:app/modules/shopApp/login/cubit/cubit.dart';
import 'package:app/modules/shopApp/login/cubit/states.dart';
import 'package:app/modules/shopApp/register/register_screen.dart';
import 'package:app/shared/componants/constants.dart';
import 'package:app/shared/componants/default_button_component.dart';
import 'package:app/shared/componants/default_field_component.dart';
import 'package:app/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShopLoginScreen extends StatelessWidget {
  var emailconroller = TextEditingController();
  var passconroller = TextEditingController();
  var fromkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
        listener: (context, state) {
          if (state is ShopLoginSuaccesState) {
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
              navAndfinish(context, ShopLayout());
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
        builder: (context, state) => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: fromkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'login now to browse our hot offers',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      DefaultField(
                          controller: emailconroller,
                          type: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please add your email';
                            }
                            return null;
                          },
                          text: 'email address',
                          pre: Icons.email_outlined),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultField(
                        controller: passconroller,
                        type: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'the password is too short';
                          }
                          return null;
                        },
                        text: 'password',
                        pre: Icons.lock,
                        suffix: ShopLoginCubit.get(context).suffix,
                        isPassword: ShopLoginCubit.get(context).isPassword,
                        sufPressed: () {
                          ShopLoginCubit.get(context).passVisibility();
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultButton(
                          text: 'LOGIN',
                          radius: 10,
                          function: () {
                            if (fromkey.currentState!.validate()) {
                              ShopLoginCubit.get(context).userLogin(
                                  email: emailconroller.text,
                                  password: passconroller.text);
                            }
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          TextButton(
                              onPressed: () {
                                navto(context,  RegisterScreen());
                              },
                              child: const Text('REGISTER')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
