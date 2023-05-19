import 'package:flutter/material.dart';


class AwesomeButtonWidget extends StatelessWidget {
  final Widget widget;
  final double? heigth;
  final Function() onPressed;
  const AwesomeButtonWidget({super.key, required this.widget, required this.onPressed,this.heigth=56});

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
          child: widget,
          // Text(text,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18,fontFamily: 'Mont'),)
          ),
    );
  }
}
