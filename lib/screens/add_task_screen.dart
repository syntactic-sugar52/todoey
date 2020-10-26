import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

String newTaskTitle; //6. add property globally. dont put inside build

class AddTaskScreen extends StatelessWidget {
  // final Function
  //     addTaskCallback; // 10. add property so task screen can see //on press requires a function
  // AddTaskScreen(this.addTaskCallback);
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return Container(
            color: Color(0xff757575),
            //curved edge bottom sheet
            child: Container(
              padding:
                  EdgeInsets.all(20.0), // padding to adjust padding  on card
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Add Task',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.lightBlueAccent, fontSize: 30.0),
                  ),
                  TextField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    onChanged: (newText) {
                      newTaskTitle = newText;
                      //7. pass new Text to newTaskTitle
                    },
                  ),
                  FlatButton(
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.lightBlueAccent,
                    onPressed: () {
                      taskData.addTask(newTaskTitle);
                      Navigator.pop(context);

                      //print(newTaskTitle); //9. print to see
                      //   addTaskCallback(newTaskTitle);
                      //12.call the callback and add the new task title as a param
                    }, //Add task to the list
                  ),
                ],
              ),
            ));
      },
    );
  }
}
