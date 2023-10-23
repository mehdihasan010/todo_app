// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utility/my_button.dart';

// ignore: must_be_immutable
class UpdateDialogBox extends StatefulWidget {
  final index;
  final controller;
  final controllerSubtitle;
  VoidCallback onCancel;
  VoidCallback onEdit;

  UpdateDialogBox({
    super.key,
    required this.index,
    required this.controller,
    required this.controllerSubtitle,
    required this.onEdit,
    required this.onCancel,
  });

  @override
  State<UpdateDialogBox> createState() => _UpdateDialogBoxState();
}

class _UpdateDialogBoxState extends State<UpdateDialogBox> {
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_myBox.get("TODOLISTS") == null) {
      db.createInitialData();
    } else {
      db.loadData();
      final title = db.toDoList[widget.index][0];
      final subtitle = db.toDoList[widget.index][1];
      widget.controller.text = title;
      widget.controllerSubtitle.text = subtitle;
      print(title);
    }

    super.initState();
    print(db.toDoList);
  }

  final _myBox = Hive.box('myboxs');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 255, 242, 0),
      // ignore: sized_box_for_whitespace
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: widget.controller,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(),
                focusColor: Colors.black,
                border: OutlineInputBorder(),
                hintText: "Add a new task Title",
              ),
            ),
            TextField(
              controller: widget.controllerSubtitle,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(),
                focusColor: Colors.black12,
                border: OutlineInputBorder(),
                hintText: "Add a new task Subtitle",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: "cancel",
                  onPressed: widget.onCancel,
                ),
                const SizedBox(
                  width: 6,
                ),
                MyButton(
                  text: "Edit",
                  onPressed: widget.onEdit,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
