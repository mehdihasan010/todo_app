// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todo_app/utility/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  final controllerSubtitle;
  VoidCallback onCancel;
  VoidCallback onSave;

  DialogBox({
    super.key,
    required this.controller,
    required this.controllerSubtitle,
    required this.onCancel,
    required this.onSave,
  });

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
              controller: controller,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(),
                focusColor: Colors.black,
                border: OutlineInputBorder(),
                hintText: "Add a new task Title",
              ),
            ),
            TextField(
              controller: controllerSubtitle,
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
                  onPressed: onCancel,
                ),
                const SizedBox(
                  width: 6,
                ),
                MyButton(
                  text: "save",
                  onPressed: onSave,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
