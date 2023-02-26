import 'package:flutter/material.dart';

class HmConfirmDialog extends StatelessWidget {
  const HmConfirmDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm'),
      content: const Text('Are you sure want to delete?'),
      actions: [
        FilledButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Yes",
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "No",
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }
}
