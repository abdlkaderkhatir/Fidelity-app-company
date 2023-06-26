import 'package:fidelity_app/model/card.dart';
import 'package:fidelity_app/services/cardService.dart';
import 'package:fidelity_app/utils/theme.dart';
import 'package:fidelity_app/views/activate_screen.dart';
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
  List<Cards> listcards = [];
  bool error = false;

  @override
  void initState() {
    // TODO: implement initState
    getListCards();
    super.initState();
  }

  getListCards() async {
    print("fetch cards");
    var response = await CardService.listClientCards();
    if (!response.error) {
      setState(() {
        listcards = response.data ?? [];
      });
    } else {
      error = true;
      print("im here");
    }
  }

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
                    const Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                  child: listcards.isNotEmpty
                      ? ListView.builder(
                          itemCount: listcards.length,
                          itemBuilder: (context, index) {
                            final card = listcards[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Container(
                                height: 8.h,
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: fieldGrey,
                                    borderRadius: BorderRadius.circular(20)),
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${card.store!.name} ${card.store!.id}',
                                        style:const TextStyle(
                                          fontFamily: "Mont",
                                          fontSize: 24,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        )),
                                    Text('points :${card.points}',
                                        style:const TextStyle(
                                          fontFamily: "Mont",
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              ),
                            );
                          })
                      : const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             SizedBox(
                              height: 50,
                              width: double.infinity,
                            ),
                             Image(
                              image: AssetImage("assets/aucun.png"),
                              height: 230,
                              width: 230,
                            ),
                             SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Vous avez pas les cartes de fidelity',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontFamily: "DIN"),
                            ),
                          ],
                        ),
                )
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
                          Get.to(() => const ActivateAccountScreen());
                        },
                        widget:const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
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
