import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TasksTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallBack;
  final Function onLongPressCallBack;
  TasksTile(
      {this.isChecked,
      this.taskTitle,
      this.checkBoxCallBack,
      this.onLongPressCallBack});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListTile(
          onLongPress: onLongPressCallBack,
          title: Text(
            taskTitle,
            style: TextStyle(
                decoration: isChecked ? TextDecoration.lineThrough : null),
          ),
          trailing: Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: isChecked,
            onChanged: checkBoxCallBack,
          ),
        );
      },
    );
  }
}

// class TaskCheckBox extends StatelessWidget {
//   final bool checkBoxState;
//   final Function toggleCheckBoxState; //to pass function checkboxcallback
//   TaskCheckBox({this.checkBoxState, this.toggleCheckBoxState});
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(value: checkBoxState, onChanged: toggleCheckBoxState);
//   }
// }
// TaskCheckBox(
//   checkBoxState: isChecked,
//   toggleCheckBoxState: (bool checkBoxState) {
//shorter version of check box call back function
// setState(() {
//   isChecked = checkBoxState;
// });
//to pass stae from stateless to statefull
//call back
//   void checkBoxCallBack(bool checkBoxState) {
//     setState(() {
//       isChecked = checkBoxState;
//     });
//   }
