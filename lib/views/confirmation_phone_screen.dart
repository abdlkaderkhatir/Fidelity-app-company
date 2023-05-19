import 'package:fidelity_app/utils/theme.dart';
import 'package:fidelity_app/widgets/awesome_button_widget.dart';
import 'package:fidelity_app/widgets/outlined_awesome_button.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class ConfirmationPhoneScreen extends StatefulWidget {
  const ConfirmationPhoneScreen({super.key});

  @override
  State<ConfirmationPhoneScreen> createState() =>
      _ConfirmationPhoneScreenState();
}

class _ConfirmationPhoneScreenState extends State<ConfirmationPhoneScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController confirmation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 36)),
            SizedBox(height: 5.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Confirm',
                      style: TextStyle(
                        fontFamily: "Mont",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  SizedBox(height: 2.h),
                  const Text(
                      'Enter The 6-digit PIN that was been sent to +213 663 12 34 56',
                      style: TextStyle(
                        fontFamily: "Mont",
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      )),
                  SizedBox(height: 5.h),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        PinCodeTextField(
                          controller: confirmation,
                          onSubmitted: (s) {},
                          enablePinAutofill: true,
                          autovalidateMode: AutovalidateMode.disabled,
                          appContext: context,
                          length: 6,
                          textStyle: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          cursorColor: Colors.black,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          autoFocus: true,
                          keyboardType: TextInputType.number,
                          cursorWidth: 0.4.w,
                          pastedTextStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                          validator: (value) {
                            if (value!.length != 6 ||
                                !RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return "Enter valid code";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            selectedFillColor: Colors.white,
                            selectedColor: geryClr,
                            activeColor: geryClr,
                            activeFillColor: Colors.white,
                            // inactiveColor: geryClr,
                            inactiveFillColor: Colors.white,
                            shape: PinCodeFieldShape.underline,
                            // borderRadius: BorderRadius.circular(5.sp),
                            fieldHeight: 34.sp,
                            fieldWidth: 34.sp,
                          ),
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                                child: AwesomeButtonWidget(
                              heigth: 48,
                              onPressed: () {},
                              widget: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Create my Profile",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontFamily: 'Mont'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                          child: OutlineAwesomeButton(
                        heigth: 48,
                        onPressed: () {},
                        text: "Resend Code",
                      ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
