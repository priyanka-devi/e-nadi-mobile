import 'package:flutter/material.dart';
import '/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;

  const RoundedPasswordField({
    Key? key,
    required this.hint,
    required this.controller
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  String textFieldsValue = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: true,
        cursorColor: kPrimaryColor,
        decoration:  InputDecoration(
          icon: const Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: const Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          hintText: widget.hint,
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Gaboleh kosong';
          }
          textFieldsValue = value;
          return null;
        },
      ),
    );
  }
}