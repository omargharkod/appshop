import 'package:app/shared/componants/default_button_component.dart';
import 'package:flutter/material.dart';

import '../../shared/componants/default_field_component.dart';



class Loginscreen extends StatefulWidget {
  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  var email = TextEditingController();

  var password = TextEditingController();

  var formkey = GlobalKey<FormState>();

  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      'login',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  DefaultField(
                      controller: email,
                      type: TextInputType.emailAddress,
                      onSubmet: (value) {
                        print(value);
                      },
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'password is empty';
                        }
                        return null;
                      },
                      text: 'email',
                      pre: Icons.email),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultField(
                    controller: password,
                    type: TextInputType.visiblePassword,
                    onSubmet: (value) {
                      print(value);
                    },
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'password is empty';
                      }
                      return null;
                    },
                    text: 'password',
                    pre: Icons.lock,
                    suffix: isPasswordShow
                        ? Icons.visibility
                        : Icons.visibility_off,
                    isPassword: isPasswordShow,
                    sufPressed: () {
                      setState(() {
                        isPasswordShow = !isPasswordShow;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  DefaultButton(
                      text: "LOGIN",
                      radius: 10,
                      function: () {
                        if (formkey.currentState!.validate()) {
                          print(email.text);
                          print(password.text);
                        }
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Dont have an account?'),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'create now',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
