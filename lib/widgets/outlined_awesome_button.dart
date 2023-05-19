import 'package:flutter/material.dart';

class OutlineAwesomeButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double? heigth;
  const OutlineAwesomeButton({super.key, required this.text, required this.onPressed,this.heigth=56});

  @override
  Widget build(BuildContext context) {
     
    return SizedBox(
      height: heigth,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.black,width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // <-- Radius
            ),
          ),
          onPressed: onPressed,
          child: Text(text,style: const TextStyle(fontSize: 22,fontFamily: 'DIN',color: Colors.black,))),
    );
  }
}