import 'package:flutter/material.dart';

class HmSaveButton extends StatelessWidget {
  final void Function()? onPressed;
  const HmSaveButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
          backgroundColor: Colors.indigo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      child: const Text(
        "Save",
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
    );
  }
}
