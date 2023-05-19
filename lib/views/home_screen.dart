import 'package:fidelity_app/utils/theme.dart';
import 'package:fidelity_app/views/activate_screen.dart';
import 'package:fidelity_app/widgets/awesome_button.dart';
import 'package:fidelity_app/widgets/awesome_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/user.jpg"),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Welcome Back 👋',
                            style: TextStyle(
                              fontFamily: "Mont",
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            )),
                        Text('Khatir Abdelkader',
                            style: TextStyle(
                              fontFamily: "Mont",
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      ],
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          LineIcons.bell,
                          size: 32,
                          color: Colors.black,
                        )),
                  ],
                ),
                // List

                const SizedBox(
                  height: 20,
                ),

                const Text('Your Subscriptions',
                    style: TextStyle(
                      fontFamily: "Mont",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),

                const SizedBox(
                  height: 10,
                ),

                Expanded(
                    child: ListView(
                  children: [
                    Container(
                      height: 8.h,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: fieldGrey,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text('Supermarket',
                          style: TextStyle(
                            fontFamily: "Mont",
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 8.h,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: fieldGrey,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text('Supermarket',
                          style: TextStyle(
                            fontFamily: "Mont",
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 8.h,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: fieldGrey,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text('Supermarket',
                          style: TextStyle(
                            fontFamily: "Mont",
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 8.h,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: fieldGrey,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text('Supermarket',
                          style: TextStyle(
                            fontFamily: "Mont",
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 8.h,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: fieldGrey,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text('Supermarket',
                          style: TextStyle(
                            fontFamily: "Mont",
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 8.h,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: fieldGrey,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text('Supermarket',
                          style: TextStyle(
                            fontFamily: "Mont",
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 8.h,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: fieldGrey,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text('Supermarket',
                          style: TextStyle(
                            fontFamily: "Mont",
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 8.h,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: fieldGrey,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text('Supermarket',
                          style: TextStyle(
                            fontFamily: "Mont",
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 8.h,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: fieldGrey,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text('Supermarket',
                          style: TextStyle(
                            fontFamily: "Mont",
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 8.h,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: fieldGrey,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text('Supermarket',
                          style: TextStyle(
                            fontFamily: "Mont",
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ))
              ],
            )),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: AnimatedSize(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 1000),
            child: Container(
              height: 10.h,
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
                          child: AwesomeButtonWidget(
                        onPressed: () {
                          Get.to(()=>const ActivateAccountScreen());
                          
                        },
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "add a Store",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: 'Mont'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              LineIcons.qrcode,
                              color: Colors.white,
                              size: 23,
                            ),
                          ],
                        ),
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
