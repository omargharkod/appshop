import 'dart:math';


import 'package:app/modules/bmiApp/resaltscreen.dart';
import 'package:app/modules/bmiApp/states/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';

class MyWidget extends StatelessWidget {
  @override
  bool isMale = true;
  double hight = 120;
  double weight = 40;
  double age = 20;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'BMI calcolertor',
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isMale ? Colors.blue : Colors.grey[400],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                isMale = true;
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Image(
                                    image: AssetImage(
                                      'images/png-transparent-gender-symbol-male-symbol-miscellaneous-monochrome-sign.png',
                                    ),
                                    height: 70,
                                    width: 70,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'male',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: !isMale ? Colors.blue : Colors.grey[400],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                CounterCubit.get(context).isMale;
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Image(
                                    image: AssetImage(
                                      'images/png-clipart-gender-symbol-female-sign-female-icon-gender-black-and-white-man-thumbnail.png',
                                    ),
                                    height: 70,
                                    width: 70,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Female',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'hight',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '${hight.round()}',
                                style: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'cm',
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Slider(
                              value: hight,
                              max: 220,
                              min: 75,
                              onChanged: (value) {
                                hight = value;
                              })
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[400],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'AGE',
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '$age',
                                  style: const TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FloatingActionButton(
                                        heroTag: "plus1",
                                        onPressed: () {
                                          CounterCubit.get(context).mainsage;
                                        },
                                        mini: true,
                                        child: const Icon(Icons.remove),
                                      ),
                                      FloatingActionButton(
                                        heroTag: "minus2",
                                        onPressed: () {
                                          CounterCubit.get(context).plusage;
                                        },
                                        mini: true,
                                        child: const Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[400],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'WEIGHT',
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '$weight',
                                  style: const TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FloatingActionButton(
                                        heroTag: "plus",
                                        onPressed: () {
                                          CounterCubit.get(context)
                                              .mainsweight();
                                        },
                                        mini: true,
                                        child: const Icon(Icons.remove),
                                      ),
                                      FloatingActionButton(
                                        heroTag: "minus",
                                        onPressed: () {
                                          CounterCubit.get(context)
                                              .plusweight();
                                        },
                                        mini: true,
                                        child: const Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.blue,
                  width: double.infinity,
                  height: 50,
                  child: MaterialButton(
                    onPressed: () {
                      double result = weight / pow(hight / 100, 2);
                      print(result);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => BmiResult(
                                age: age,
                                result: result,
                                isMale: isMale,
                              )),
                        ),
                      );
                    },
                    child: const Text(
                      'calcoletor',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
