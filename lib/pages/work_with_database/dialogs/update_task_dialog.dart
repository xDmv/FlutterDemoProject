import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example_app/generated/l10n.dart';
import 'package:example_app/pages/work_with_database/database_example_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateTaskAlertDialog extends StatefulWidget {
  const UpdateTaskAlertDialog({
    required this.task,
    Key? Key,
  }) : super(key: Key);

  final TaskModel task;

  @override
  State<UpdateTaskAlertDialog> createState() => _UpdateTaskAlertDialogState();
}

class _UpdateTaskAlertDialogState extends State<UpdateTaskAlertDialog> {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    taskNameController.text = widget.task.taskName;
    taskDescController.text = widget.task.taskDesc;

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AlertDialog(
      scrollable: true,
      title: Text(
        S.of(context).updateTask,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
      content: SizedBox(
        height: height * 0.35,
        width: width,
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: taskNameController,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  icon: const Icon(
                    CupertinoIcons.square_list,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: taskDescController,
                keyboardType: TextInputType.multiline,
                maxLines: 9,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8),
                  icon: const Icon(
                    CupertinoIcons.bubble_left_bubble_right,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
          ),
          child: Text(S.of(context).cancel),
        ),
        ElevatedButton(
          onPressed: () {
            final taskName = taskNameController.text;
            final taskDesc = taskDescController.text;

            _updateTasks(taskName, taskDesc);
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Text(S.of(context).save),
        ),
      ],
    );
  }

  Future _updateTasks(String taskName, String taskDesc) async {
    var collection = FirebaseFirestore.instance.collection('tasks');
    collection
        .doc(widget.task.taskId)
        .update({
          'taskName': taskName,
          'taskDesc': taskDesc,
        })
        .then(
          (_) => Fluttertoast.showToast(
              msg: S.of(context).taskUpdatedSuccessfully,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 14.0),
        )
        .catchError(
          (error) => Fluttertoast.showToast(
              msg: "Failed: $error",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 14.0),
        );
  }
}
