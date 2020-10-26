import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_list.dart';
import 'add_task_screen.dart';
import 'package:todoey/models/task.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  //2. convert to stateful widget
  // List<Task> tasks = [
  //   Task(name: 'Buy milk'),
  //   Task(name: 'Buy this'),
  //   Task(name: 'Buy that')
  // ]; //1. move List<Task> to global state.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => FractionallySizedBox(
                      heightFactor: 0.65,
                      child: AddTaskScreen(),
                      // child: AddTaskScreen(
                      //   (newTaskTitle) {
                      //     // 11.takes a callback from the final property of add task screen
                      //     setState(() {
                      //       tasks.add(Task(name: newTaskTitle));
                      //     });
                      //     //print(newTaskTitle);
                      //     Navigator.pop(context);
                      //   },
                      // ), //add callback to pass property that was used in onchange in add task
                    ));
          }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Todoey',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${Provider.of<TaskData>(context).tasks.length} Tasks', //provider
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(), //5.add task parameter
            ),
          ),
        ],
      ),
    );
  }
}
