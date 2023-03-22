
import 'package:flutter/material.dart';

class messengerscreen extends StatelessWidget {
  const messengerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQacOvmH78ZbqS34SvPOKfOzr9zaLBulSJKWg&usqp=CAU'),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'chat',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blue,
                child: Icon(Icons.camera_alt, size: 18)),
          ),
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                size: 18,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 100,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildstory(),
                  separatorBuilder: ((context, index) => const SizedBox(
                        width: 20,
                      )),
                  itemCount: 15),
            ),
            const SizedBox(
              height: 15,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => buildchat(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
              itemCount: 15,
            ),
          ]),
        ),
      ),
    );
  }
}

buildchat() => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQacOvmH78ZbqS34SvPOKfOzr9zaLBulSJKWg&usqp=CAU'),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "omar gharkod",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: const [
                  Text(
                    'data lksdnckdnsl klwmdcklnsdklv ',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    '10:29pm',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
buildstory() => SizedBox(
      width: 60,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: const [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQacOvmH78ZbqS34SvPOKfOzr9zaLBulSJKWg&usqp=CAU'),
                radius: 30,
              ),
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 8,
              ),
            ],
          ),
          const Text(
            "omar mohmmed gharkod",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
