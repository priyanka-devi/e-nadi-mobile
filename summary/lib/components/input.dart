import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;

  const InputField({
    Key? key,
    required this.hint,
    required this.controller,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  String textFieldsValue = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 7),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        width: size.width * 0.7,
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(29),
        ),
        child: TextFormField(
          controller: widget.controller,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            icon: const Icon(
              Icons.people,
              color: Colors.brown,
            ),
            hintText: widget.hint,
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please fill out this field.';
            }
            textFieldsValue = value;
            return null;
          },
        ));
  }
}
