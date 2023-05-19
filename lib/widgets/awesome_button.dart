import 'package:flutter/material.dart';


class AwesomeButton extends StatelessWidget {
  final String text;
  final double? heigth;
  final Function() onPressed;
  const AwesomeButton({super.key, required this.text, required this.onPressed,this.heigth=56});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heigth,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // <-- Radius
            ),
          ),
          onPressed: onPressed,
          child: Text(text,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18,fontFamily: 'Mont'),)),
    );
  }
}
