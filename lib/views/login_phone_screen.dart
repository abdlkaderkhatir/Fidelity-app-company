import 'package:fidelity_app/routes/routes.dart';
import 'package:fidelity_app/widgets/awesome_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginPhoneScreen extends StatefulWidget {
  const LoginPhoneScreen({super.key});

  @override
  State<LoginPhoneScreen> createState() => _LoginPhoneScreenState();
}

class _LoginPhoneScreenState extends State<LoginPhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      backgroundColor: Colors.white,
      body:Container(
        height: double.infinity,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              SizedBox(height: 5.h),
              IconButton(onPressed: (){
                Get.back();
              }, 
              icon:const Icon(Icons.arrow_back_ios_new_rounded,size: 36)
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Login',
                              style: TextStyle(
                                fontFamily: "Mont",
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                    SizedBox(height: 2.h),
                    const Text('Your phone number is used to identify you in your favourite stores',
                              style: TextStyle(
                                fontFamily: "Mont",
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              )),
                    SizedBox(height: 5.h),

                    Container(
                      height: 48,
                      padding:const EdgeInsets.only(right: 3),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        children: [
                           const Padding(
                             padding: EdgeInsets.symmetric(horizontal: 15),
                             child: Image(
                                image: AssetImage("assets/flag.png"),
                                fit: BoxFit.cover,
                                height:21 ,
                                width: 32,
                              ),
                           ),
                           const VerticalDivider(color: Colors.grey,thickness: 1,),
                           Expanded(
                            child:TextFormField(
                              style: const TextStyle(fontSize: 20),
                              maxLines: 1,
                              // controller: authController.phoneController,
                              validator: (value) {
                                if (value.toString().length == 9 ||
                                    value.toString().length == 10) {
                                  return null;
                                } else {
                                  return "Enter valid phone";
                                }
                              },
                              keyboardType: TextInputType.phone,
                              decoration:const InputDecoration(
                                hintText: "795818807",
                                filled: true,
                                isDense: true,
                                fillColor:Colors.white ,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none
                              )),  ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(child: AwesomeButton(text: "Send Code", heigth: 48,onPressed: (){
                          Get.toNamed(Routes.confirmePhone);
                        }))
                      ],
                    ),
                  ],
                ),
              )

          ],
        ),
      ),
    ));
  }
}