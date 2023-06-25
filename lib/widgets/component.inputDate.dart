import 'package:fidelity_app/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class InputDateComponent extends StatefulWidget {
  String? leadingIcon;
  String hintText;
  var controller;
  String? Function(String?) validate;
  Function(DateTime) function;

  InputDateComponent(
      {Key? key,
      this.leadingIcon,
      required this.hintText,
      required this.controller,
      required this.function,required this.validate})
      : super(key: key);

  @override
  State<InputDateComponent> createState() => _InputDateComponentState();
}

class _InputDateComponentState extends State<InputDateComponent> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validate,
      onTap: () {
        Get.bottomSheet(Container(
            height: 40.h,
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: CupertinoDatePicker(
                    maximumYear:
                        DateTime.now().subtract(const Duration(days: 2190)).year,
                    initialDateTime:
                        DateTime.now().subtract(const Duration(days: 2190)),
                    minimumYear:DateTime.now().subtract(const Duration(days: 29190)).year ,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: widget.function,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "save".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                            color: mainColor),
                      )),
                )
              ],
            )));
      },
      readOnly: true,
      cursorColor: secondaryColor,
      style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0.05.h, horizontal: 0.0),
        prefixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            width: 5.w,
          ),
          // SvgPicture.asset(widget.leadingIcon),
          SizedBox(
            width: 5.w,
          ),
          Container(
            height: 3.h,
            width: 0.2.w,
            color: const Color.fromRGBO(112, 112, 112, 1).withOpacity(0.3),
          ),
          SizedBox(
            width: 3.w,
          ),
        ]),
        prefixIconConstraints: BoxConstraints(maxHeight: 24.h, maxWidth: 70.w),
        suffixIconConstraints: BoxConstraints(
          maxHeight: 12.sp,
          maxWidth: 50.w,
        ),
        filled: true,
        fillColor: greyColor,
        hintText: widget.hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: greyColor),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: greyColor),
          borderRadius: BorderRadius.circular(8.sp),
        ),
      ),
    );
  }
}
