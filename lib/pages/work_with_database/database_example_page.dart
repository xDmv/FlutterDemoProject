import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example_app/generated/l10n.dart';
import 'package:example_app/pages/work_with_database/dialogs/add_task_dialog.dart';
import 'package:example_app/pages/work_with_database/dialogs/delete_task_dialog.dart';
import 'package:example_app/pages/work_with_database/dialogs/update_task_dialog.dart';
import 'package:flutter/material.dart';

class DatabaseExamplePage extends StatefulWidget {
  const DatabaseExamplePage({super.key});

  static const path = '/databaseExample';

  @override
  _DatabaseExamplePageState createState() => _DatabaseExamplePageState();
}

class _DatabaseExamplePageState extends State<DatabaseExamplePage> {
  final fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).workingWithTheDatabase),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fireStore.collection('tasks').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text(S.of(context).taksIsEmpty));
          } else {
            final items = snapshot.data!.docs;

            if (items.isEmpty) {
              return Center(child: Text(S.of(context).taksIsEmpty));
            }

            return ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (BuildContext context, int index) {
                final task = TaskModel.fromJson(
                    items[index].data()! as Map<String, dynamic>);

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    task.taskName,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ],
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      task.taskDesc,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        PopupMenuButton(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                value: 'edit',
                                child: Text(
                                  S.of(context).edit,
                                  style: TextStyle(fontSize: 13.0),
                                ),
                                onTap: () => _showUpdateTaskDialog(task),
                              ),
                              PopupMenuItem(
                                value: 'delete',
                                child: Text(
                                  S.of(context).delete,
                                  style: TextStyle(fontSize: 13.0),
                                ),
                                onTap: () => _showDeleteTaskDialog(task),
                              ),
                            ];
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showTaskCreationDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showTaskCreationDialog() async {
    await Future.delayed(
      const Duration(seconds: 0),
      () => showDialog(
        context: context,
        builder: (context) => const AddTaskAlertDialog(),
      ),
    );
  }

  Future<void> _showUpdateTaskDialog(TaskModel task) async {
    await Future.delayed(
      const Duration(seconds: 0),
      () => showDialog(
        context: context,
        builder: (context) => UpdateTaskAlertDialog(
          task: task,
        ),
      ),
    );
  }

  Future<void> _showDeleteTaskDialog(TaskModel task) async {
    await Future.delayed(
      const Duration(seconds: 0),
      () => showDialog(
        context: context,
        builder: (context) => DeleteTaskDialog(task: task),
      ),
    );
  }
}

class TaskModel {
  TaskModel({
    required this.taskId,
    required this.taskName,
    required this.taskDesc,
  });

  factory TaskModel.fromJson(Map<String, dynamic> data) {
    return TaskModel(
      taskId: (data['id']),
      taskName: (data['taskName']),
      taskDesc: (data['taskDesc']),
    );
  }

  String taskId;
  String taskName;
  String taskDesc;
}
