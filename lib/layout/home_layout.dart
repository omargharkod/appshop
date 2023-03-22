
import 'package:app/shared/componants/default_field_component.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../modules/todoApp/archive_tasks.dart';
import '../modules/todoApp/done_tasks.dart';
import '../modules/todoApp/tasksscreen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> screen = [
    const TasksScreen(),
    const DoneTasks(),
    const ArchiveTasks(),
  ];
  List<String> title = [
    'NEW TASKS',
    'DONE TASKS',
    'ARCHIVE TASKS',
  ];
  late Database database;
  var Scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  bool isshowBottomSheet = false;
  IconData newicon = Icons.add;
  var titlecontroller = TextEditingController();
  var timecontroller = TextEditingController();
  var datacontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    CreateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Scaffoldkey,
      appBar: AppBar(
        title: Text(
          title[currentIndex],
        ),
      ),
      body: screen[currentIndex],
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (isshowBottomSheet) {
              if (formkey.currentState!.validate()) {
                Navigator.pop(context);
                isshowBottomSheet = false;
                setState(() {
                  newicon = Icons.edit;
                });
              }
            } else {
              Scaffoldkey.currentState!.showBottomSheet(
                (context) => Container(
                  color: Colors.grey[100],
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DefaultField(
                              controller: titlecontroller,
                              type: TextInputType.text,
                              validator: (text) {
                                if (text!.isEmpty) {
                                  return 'title is empty';
                                }
                                return null;
                              },
                              text: 'Text title',
                              pre: Icons.title),
                          const SizedBox(
                            height: 15,
                          ),
                          DefaultField(
                              controller: timecontroller,
                              type: TextInputType.text,
                              onTap: () {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then((value) {
                                  timecontroller.text =
                                      value!.format(context).toString();
                                  print(value.format(context));
                                });
                              },
                              validator: (time) {
                                if (time!.isEmpty) {
                                  return 'time is empty';
                                }
                                return null;
                              },
                              text: 'Text time',
                              pre: Icons.watch_later_outlined),
                          const SizedBox(
                            height: 15,
                          ),
                          DefaultField(
                              controller: datacontroller,
                              type: TextInputType.datetime,
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2023-3-5'),
                                ).then((value) {
                                  datacontroller.text =
                                      DateFormat.yMMMEd().format(value!);
                                });
                              },
                              validator: (data) {
                                if (data!.isEmpty) {
                                  return 'data is empty';
                                }
                                return null;
                              },
                              text: 'Text data',
                              pre: Icons.calendar_today),
                        ],
                      ),
                    ),
                  ),
                ),
              );

              isshowBottomSheet = true;
              setState(() {
                newicon = Icons.add;
              });
            }
          },
          child: Icon(newicon)),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (Index) {
            setState(() {
              currentIndex = Index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
            BottomNavigationBarItem(
                icon: Icon(Icons.check_circle_outline), label: 'Done'),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive_outlined), label: 'Archive'),
          ]),
    );
  }

  void CreateDatabase() async {
    var database = await openDatabase(
      'todo.db',
      onCreate: (database, version) {
        print('create db');
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY,title TEXT,data TEXT,time TEXT,state TEXT )')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error on create table ${error.toString()}');
        });
      },
      onOpen: (database) {
        print('open');
      },
    );
  }
}
