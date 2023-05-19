import 'package:fidelity_app/routes/routes.dart';
import 'package:fidelity_app/utils/theme.dart';
import 'package:fidelity_app/widgets/awesome_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
         Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(bottom: 10.h),
          child:const Image(
            image: AssetImage("assets/back.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: AnimatedSize(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 1000),
            child: Container(
              height: 18.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: [
                      Expanded(
                          child: AwesomeButton(
                        onPressed: () {
                          Get.toNamed(
                              Routes.loginPhone);
                        },
                        text: "Get Started",
                      )),
                    ])
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    ));
  }
}
