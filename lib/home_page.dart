import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_list/database.dart';
import 'package:todo_list/dialog_box.dart';
import '../todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}


class _HomepageState extends State<Homepage> {
  final _mybox = Hive.box('mybox');
  final _controller=TextEditingController();
  tododatbase db =tododatbase();
  @override
  void initState() {
    if(_mybox.get("TODOLIST")==null){
      db.createintdata();
    }
    else{
      db.loaddata();
    }
    super.initState();
  }
  void checkBoxChanged (bool ? value,int index){
    setState(() {
      db.todolist[index][1] =! db.todolist[index][1];
    });
    db.updatedatabase();
  }
  void savenewtask(){
    setState(() {
      db.todolist.add([_controller.text,false]);
    });
    Navigator.of(context).pop();
    db.updatedatabase();
  }
  void createnewtask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: savenewtask,
        onCancel:()=>Navigator.of(context).pop(),
      );
    }
    );
  }
  void deletetask(int index){
    setState(() {
      db.todolist.removeAt(index);

    });
    db.updatedatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("TO DO"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed:createnewtask,
          child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: db.todolist.length, // Example count
        itemBuilder: (context, index) {
          return todotile(
              taskname: db.todolist[index][0],
              taskdone: db.todolist[index][1],
              onchanged: (value) => checkBoxChanged(value,index),
            deleteFunction: (context)=>deletetask(index),
          ); // Ensure TodoTile is properly defined
        },
      ),
    );
  }
}
