import 'package:example_app/generated/l10n.dart';
import 'package:example_app/widgets/card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogsPage extends StatefulWidget {
  const DialogsPage({super.key});

  static const path = '/dialogsPage';

  @override
  State<DialogsPage> createState() => _DialogsPageState();
}

class _DialogsPageState extends State<DialogsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).messageWindows),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            CardWidget(
              title: 'CupertinoDatePicker',
              onPressed: _showCupertinoDatePicker,
            ),
            CardWidget(
              title: 'CupertinoTimerPicker',
              onPressed: _showCupertinoTimerPicker,
            ),
            CardWidget(
              title: 'CupertinoActionSheet',
              onPressed: _showCupertinoActionSheet,
            ),
            CardWidget(
              title: 'MaterialDatePicker',
              onPressed: _showMaterialDatePicker,
            ),
            CardWidget(
              title: 'MaterialTimePicker',
              onPressed: _showMaterialTimePicker,
            ),
            CardWidget(
              title: 'ModalBottomSheet',
              onPressed: _showModalBottomSheet,
            ),
            CardWidget(
              title: 'AlertDialog',
              onPressed: _showAlertDialog,
            ),
            CardWidget(
              title: 'SnackBar',
              onPressed: _showSnackBar,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMaterialDatePicker() async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2027),
    );
  }

  Future<void> _showMaterialTimePicker() async {
    await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

  Future<void> _showCupertinoDatePicker() async {
    await showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 300,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 230,
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                // ignore: no-empty-block
                onDateTimeChanged: (val) => setState(() {}),
              ),
            ),
            CupertinoButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showCupertinoTimerPicker() async {
    await showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 300,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 230,
              child: CupertinoTimerPicker(
                // ignore: no-empty-block
                onTimerDurationChanged: (Duration value) {},
              ),
            ),
            CupertinoButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showCupertinoActionSheet() async {
    await showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoActionSheet(
        title: const Text('Title'),
        message: const Text('Message'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: const Text('Action One'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoActionSheetAction(
            child: const Text('Action Two'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  void _showModalBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('SnackBar!'),
        action: SnackBarAction(
          label: 'Done',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      ),
    );
  }

  Future<void> _showAlertDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Title'),
          content: const Text('Message'),
          actions: [
            TextButton(
              child: Text(S.of(context).cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
