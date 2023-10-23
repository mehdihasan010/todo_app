import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];

  final _myBox = Hive.box('myboxs');

  void createInitialData() {
    toDoList = [];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLISTS");
  }

  void updateDataBase() {
    _myBox.put("TODOLISTS", toDoList);
  }
}
