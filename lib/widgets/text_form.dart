import 'package:fidelity_app/utils/theme.dart';
import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final Function validator;
  final int maxline;
  final TextInputType inputType;
  const TextForm({
      super.key,
      required this.controller,
      required this.validator,
      required this.text, 
      this.inputType = TextInputType.text,
      this.maxline=1, });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextFormField(
            textAlignVertical: TextAlignVertical.bottom,
            cursorWidth: 2,
            keyboardType: inputType,
            style: const TextStyle(fontSize: 20),
            maxLines: maxline,
            controller: controller,
            validator: (value) => validator(value),
            decoration:  InputDecoration(
            hintText: text,
            filled: true,
            isDense: true,
            fillColor: Colors.white,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: fieldGrey, width: 1),
            ),
            focusedBorder:const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: fieldGrey, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: fieldGrey),
              borderRadius: BorderRadius.circular(10),
            ),
          )),
    );
  }
}
