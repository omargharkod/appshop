import 'package:app/modules/shopApp/login/shop_login_screen.dart';
import 'package:app/shared/componants/constants.dart';
import 'package:app/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class modelBoading {
  late final String image;
  late final String title;
  late final String body;

  modelBoading({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<modelBoading> boading = [
    modelBoading(
      image: 'assets/images/on_boading7.png',
      title: 'title 1',
      body: 'body 1',
    ),
    modelBoading(
      image: 'assets/images/on_boading6.jpg',
      title: 'title 2',
      body: 'body 2',
    ),
    modelBoading(
      image: 'assets/images/on_boading5.jpg',
      title: 'title 3',
      body: 'body 3',
    )
  ];
  // void submit() async {
  //   await CacheHelper.saveData(key: 'onboading', value: true).then((value) {
  //     if (value) {
  //       navAndfinish(context, ShopLoginScreen());
  //     }
  //   });
  // }

  var boadcontrollar = PageController();
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                CacheHelper.saveData(key: 'onboading', value: true);
                navAndfinish(context, ShopLoginScreen());
              },
              child: const Text(
                'SKIP',
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: ((int index) {
                    if (index == boading.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  }),
                  controller: boadcontrollar,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildBoanding(boading[index]),
                  itemCount: boading.length,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                      controller: boadcontrollar,
                      effect: const ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Colors.deepOrange,
                        dotHeight: 10,
                        dotWidth: 10,
                        expansionFactor: 4,
                        spacing: 5,
                      ),
                      count: boading.length),
                  const Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast == true) {
                        CacheHelper.saveData(key: 'onboading', value: true);
                        navAndfinish(context, ShopLoginScreen());
                      } else {
                        boadcontrollar.nextPage(
                            duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: const Icon(Icons.arrow_forward_ios_outlined),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget buildBoanding(modelBoading model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Image(
            image: AssetImage(
              model.image,
            ),
          )),
          const SizedBox(
            height: 30,
          ),
          Text(
            model.title,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            model.body,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      );
}
