import 'package:cloud_firestore/cloud_firestore.dart'; // Import Cloud Firestore
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../utils/constant/global.dart';
import '../../../../utils/hepler/cloud_firestore/todo_helper.dart';
import '../../Todo_Screen/Views/todo_tile.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  late Future<List<Map<String, dynamic>>> todoList;

  void checkBoxChanged(bool? value, int id) async {
    final Database db = await DBHelper.instance.database;

    await db.update(
      'todo',
      {'taskCompleted': value == true ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );

    setState(() {
      todoList = db.query('todo');
    });

    FirebaseFirestore.instance.collection('todos').doc(id.toString()).update({
      'taskCompleted': value,
    });
  }

  void saveNewTask() async {
    final Database db = await DBHelper.instance.database;
    await db.insert('todo', {
      'taskName': todoController.text,
      'taskCompleted': false,
    });

    setState(() {
      todoList = db.query('todo');
    });

    FirebaseFirestore.instance.collection('todos').add({
      'taskName': todoController.text,
      'taskCompleted': false,
      'timestamp': FieldValue.serverTimestamp(),
    });

    todoController.text = "";
    Get.back();
  }

  void deleteTask(int id) async {
    final Database db = await DBHelper.instance.database;
    await db.delete('todo', where: 'id = ?', whereArgs: [id]);

    setState(() {
      todoList = db.query('todo');
    });

    FirebaseFirestore.instance.collection('todos').doc(id.toString()).delete();
  }

  void initState() {
    super.initState();
    todoList = DBHelper.instance.database.then((db) {
      return db.query('todo');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xff9395D3),
        title: Text("To Do"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xff9395D3),
        shape: CircleBorder(),
        onPressed: () async {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Color(0xffB3B7EE),
                title: Text(
                  "Todo App",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                content: Container(
                  height: height * 0.30,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: addInFormKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextField(
                              controller: todoController,
                              onChanged: (val) {},
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Add a new task",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.025,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      cancelText: "Dismiss",
                                      confirmText: "Confirm",
                                      context: context,
                                      initialDate: initialDate,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(3000),
                                    );
                                    setState(
                                      () {
                                        date = pickedDate;
                                      },
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.calendar_month_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      context: context,
                                      initialTime: initialTime,
                                    );
                                    setState(
                                      () {
                                        time = pickedTime;
                                      },
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.watch_later_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: height * 0.075,
                                  width: width * 0.25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: GestureDetector(
                                    onTap: saveNewTask,
                                    child: Center(
                                      child: Text(
                                        "Save",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff9395D3),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height * 0.075,
                                  width: width * 0.25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Center(
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff9395D3),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: todoList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final todos = snapshot.data!;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Todo_Tile(
                  taskName: todos[index]['taskName'],
                  taskCompleted: todos[index]['taskCompleted'] == 1,
                  onChanged: (value) =>
                      checkBoxChanged(value, todos[index]['id']),
                  deleteFunction: (p0) => deleteTask(todos[index]['id']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
