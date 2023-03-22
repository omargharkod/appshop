import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            leading: const Icon(Icons.menu),
            title: const Text(
              'First App',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  print('object');
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  print('hello');
                },
                icon: const Text('hello'),
              )
            ]),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const Image(
                      image: NetworkImage(
                          'https://cdn.britannica.com/45/5645-050-B9EC0205/head-treasure-flower-disk-flowers-inflorescence-ray.jpg'),
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: 200,
                      color: Colors.black.withOpacity(0.7),
                      padding: const EdgeInsets.symmetric(
                        vertical: 7,
                      ),
                      child: const Text(
                        "flower",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
