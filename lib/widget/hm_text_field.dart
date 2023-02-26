import 'package:flutter/material.dart';

class HmTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  const HmTextField({
    Key? key,
    this.label,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label!,
          labelStyle: const TextStyle(
            color: Colors.blueGrey,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey,
            ),
          ),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
