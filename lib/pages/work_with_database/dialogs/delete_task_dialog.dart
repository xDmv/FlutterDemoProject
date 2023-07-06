import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example_app/generated/l10n.dart';
import 'package:example_app/pages/work_with_database/database_example_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DeleteTaskDialog extends StatefulWidget {
  const DeleteTaskDialog({
    required this.task,
    Key? key,
  }) : super(key: key);

  final TaskModel task;

  @override
  State<DeleteTaskDialog> createState() => _DeleteTaskDialogState();
}

class _DeleteTaskDialogState extends State<DeleteTaskDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        S.of(context).deleteTask,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      content: SizedBox(
        child: Form(
          child: Column(
            children: <Widget>[
              Text(
                S.of(context).areYouSureYouWantToDeleteThisTask(widget.task.taskName.toString()),
                style: TextStyle(fontSize: 14),
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
            _deleteTasks();
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Text(S.of(context).delete),
        ),
      ],
    );
  }

  Future _deleteTasks() async {
    var collection = FirebaseFirestore.instance.collection('tasks');
    collection
        .doc(widget.task.taskId)
        .delete()
        .then(
          (_) => Fluttertoast.showToast(
              msg: S.of(context).taskDeletedSuccessfully,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 14.0),
        )
        .catchError(
          (error) => Fluttertoast.showToast(
              msg: S.of(context).failedError,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 14.0),
        );
  }
}

// final collection = FirebaseFirestore.instance.collection('collection');
// collection
//     .doc('some_id') // <-- Doc ID to be deleted.
// .delete() // <-- Delete
//     .then((_) => print('Deleted'))
// .catchError((error) => print('Delete failed: $error'));
