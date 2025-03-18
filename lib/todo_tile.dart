import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class todotile extends StatelessWidget {
  final String taskname;
  final bool taskdone;
  Function(bool?)?onchanged;
  Function(BuildContext)? deleteFunction;
  todotile({super.key,
  required this.taskname,
  required this.taskdone,
    required this.onchanged,
    required this.deleteFunction,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0,right: 25,top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(),
          children:[
            SlidableAction(
                onPressed:deleteFunction,
            icon:Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(15),
      )
          ]
          ,),
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(color: Colors.yellow,
          borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            children: [
               Checkbox(
            value: taskdone,
            onChanged:onchanged,
            activeColor: Colors.black,
          ),
              Text(
                taskname,
              style: TextStyle(
                decoration:taskdone
                  ? TextDecoration.lineThrough
                  :TextDecoration.none,
              ),
              ),
            ],
          ),
        
        ),
      ),
    );
  }
}

