import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskname;
  final String tasksubname;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletefunction;
  Function(BuildContext)? updatedata;

  ToDoTile({
    super.key,
    required this.taskname,
    required this.tasksubname,
    required this.taskCompleted,
    required this.onChanged,
    required this.deletefunction,
    required this.updatedata,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deletefunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          SlidableAction(
            onPressed: updatedata,
            icon: Icons.edit,
            backgroundColor: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: const Color(0xFFFFF200),
                borderRadius: BorderRadius.circular(12)),
            // ignore: prefer_const_constructors
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              leading: Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              title: Text(
                taskname,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              subtitle: Text(
                tasksubname,
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            )),
      ),
    );
  }
}

//Make tutorial