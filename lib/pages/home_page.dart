// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utility/dialog_box.dart';
import 'package:todo_app/utility/todo_til.dart';
import 'package:todo_app/utility/update_dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_myBox.get("TODOLISTS") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final _myBox = Hive.box('myboxs');

  final _controller = TextEditingController();
  final _controllerSubtitle = TextEditingController();

  //list of todo tasks

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][2] = !db.toDoList[index][2];
    });
    db.updateDataBase();
  }

  void cancelTask() {
    _controller.clear();
    _controllerSubtitle.clear();
    Navigator.of(context).pop();
  }

  void saveNewTask() {
    setState(() {
      _controller.text.isNotEmpty
          ? db.toDoList.add([_controller.text, _controllerSubtitle.text, false])
          : null;
      _controller.clear();
      _controllerSubtitle.clear();
    });
    print(db.toDoList);
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            controllerSubtitle: _controllerSubtitle,
            onSave: saveNewTask,
            onCancel: () => cancelTask(),
          );
        });
  }

  void deletetask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void updateData(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return UpdateDialogBox(
            index: index,
            controller: _controller,
            controllerSubtitle: _controllerSubtitle,
            onEdit: () => updatetask(index),
            onCancel: () => cancelTask(),
          );
        });
  }

  void updatetask(int index) {
    setState(() {
      db.toDoList[index][0] = _controller.text;
      db.toDoList[index][1] = _controllerSubtitle.text;
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 248, 228, 115),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 242, 0),
          title: const Text("TO DO"),
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskname: db.toDoList[index][0],
              tasksubname: db.toDoList[index][1],
              taskCompleted: db.toDoList[index][2],
              onChanged: (value) => checkBoxChanged(value, index),
              deletefunction: (context) => deletetask(index),
              updatedata: (context) => updateData(index),
            );
          },
        ));
  }
}
