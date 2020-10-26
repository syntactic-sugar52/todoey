import 'package:flutter/material.dart';
import 'tasks_tile.dart';
// import 'package:todoey/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

// class TasksList extends StatefulWidget {
//   //3. add property
//   // final List<Task> tasks;
//   // TasksList(this.tasks);
//   @override
//   _TasksListState createState() => _TasksListState();
// }

class TasksList extends StatelessWidget {
  //make stateless because no longer passing it bec of provider
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          //4. add widget object to tasks //widget refers to the widget in stateful widget
          // 15. replace widget with provider.of then specify what data to pass
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TasksTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkBoxCallBack: (bool checkBoxState) {
                taskData.updateTask(task);

                // setState(() {
                //   Provider.of<TaskData>(context).tasks[index].toggleDone();
                // });
              },
              onLongPressCallBack: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
