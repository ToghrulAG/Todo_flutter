import 'package:flutter/material.dart';

class AddTodoDialog extends StatelessWidget {
  const AddTodoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Title'),
      content: Text('Empty dialog'),
      actions: [
        TextButton(onPressed: Navigator.of(context).pop, child: Text('Close')),
      ],
    );
  }
}
