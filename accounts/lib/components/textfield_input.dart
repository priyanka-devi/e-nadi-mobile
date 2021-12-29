import 'package:flutter/material.dart';
import '/constants.dart';

class RoundedInput extends StatefulWidget {
  final String hint;
  final TextEditingController controller;

  const RoundedInput({
    Key? key,
    required this.hint,
    required this.controller,
  }) : super(key: key);

  @override
  State<RoundedInput> createState() => _RoundedInputState();
}

class _RoundedInputState extends State<RoundedInput> {
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
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            icon: const Icon(
              Icons.perm_contact_cal,
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
        ));
  }
}
