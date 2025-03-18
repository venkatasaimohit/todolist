import 'package:hive/hive.dart';

class tododatbase{
  List todolist=[];
  final _mybox=Hive.box('mybox');
  void createintdata(){
    todolist=[
      ["make tutorial",false],
      ["go to gym",false],
    ];
  }
  void loaddata(){
    todolist=_mybox.get("TODOLIST");
  }
  void updatedatabase(){
     _mybox.put("TODOLIST", todolist);
  }
}