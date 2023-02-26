import 'package:flutter/material.dart';

class HmAddButton extends StatelessWidget {
  final void Function()? onPressed;
  const HmAddButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.indigo,
      child: const Icon(
        Icons.add,
        size: 20,
        color: Colors.white,
      ),
    );
  }
}
