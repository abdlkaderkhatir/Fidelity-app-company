import 'package:fidelity_app/controllers/signup_controller.dart';
import 'package:fidelity_app/model/registration.dart';
import 'package:fidelity_app/services/authService.dart';
import 'package:fidelity_app/utils/theme.dart';
import 'package:fidelity_app/views/home_screen.dart';
import 'package:fidelity_app/widgets/awesome_button_widget.dart';
import 'package:fidelity_app/widgets/component.inputDate.dart';
import 'package:fidelity_app/widgets/text_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CompleteInscriptionScreen extends StatefulWidget {
  const CompleteInscriptionScreen({super.key});

  @override
  State<CompleteInscriptionScreen> createState() =>
      _CompleteInscriptionScreenState();
}

class _CompleteInscriptionScreenState extends State<CompleteInscriptionScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String selectedGender = "Male";

  List<String> genderList = [
    'Male',
    'Female',
  ];

  final controller = Get.put(SignUpController());
  FirebaseAuth auth = FirebaseAuth.instance;
  String idTokenResult = "";

  @override
  void initState() {
    // TODO: implement initState
    getIdToken().then((value) => print(value));
    super.initState();
  }

  // getIdToken() async {
  //   User user = auth.currentUser!;
  //   print("==================UID===================");
  //   print(user.uid);
  //   print("==================UID===================");
  // }
  Future<String> getIdToken() async {
    User user = auth.currentUser!;
    idTokenResult = await user.getIdToken();
    return idTokenResult;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          // height: double.infinity,
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
                    const Text('Create Your Profile',
                        style: TextStyle(
                          fontFamily: "Mont",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    SizedBox(height: 5.h),

                    // Form
                    Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextForm(
                                controller: nameController,
                                validator: (value) {},
                                text: "Full Name"),
                            const SizedBox(height: 20),
                            TextForm(
                                controller: emailController,
                                validator: (value) {},
                                text: "Email"),
                            const SizedBox(height: 20),
                            Obx(
                              () => InputDateComponent(
                                // leadingIcon: 'assets/icons/fi-rr-calendar.svg',
                                hintText:
                                    controller.birthDateController.value == ""
                                        ? 'birthDate'.tr
                                        : controller.birthDateController.value,
                                controller: controller,
                                function: controller.changeDate,
                                validate: (value) {
                                  if (controller.birthDateController.isEmpty) {
                                    return "birthdate_req".tr;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 48,
                              child: DropdownButtonFormField(
                                iconDisabledColor: Colors.white,
                                iconEnabledColor: Colors.white,
                                value: selectedGender,
                                items: genderList.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedGender = newValue!;
                                  });
                                },
                                decoration: const InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 24,
                                    color: fieldGrey,
                                  ),
                                  // labelText: 'Gender',
                                  isDense: true,
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: fieldGrey, width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: fieldGrey, width: 1),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                    child: AwesomeButtonWidget(
                                        widget: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "Start Now",
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
                                        heigth: 48,
                                        onPressed: () async {
                                          print("Hello ");
                                          if (formKey.currentState!
                                              .validate()) {
                                            // controller.switchBool();
                                            var response =
                                                await AuthService.signUp(
                                                    RegistrationModel(
                                              name: nameController.text,
                                              email: emailController.text,
                                              idToken: idTokenResult,
                                              gender: selectedGender,
                                              birthDay: controller
                                                  .birthDateController.value,
                                            ));

                                            if (response.error) {
                                              //snackBarModel("echec".tr,response.errorMessage , true);
                                              // controller.switchBool();
                                              print(response.errorMessage);
                                            } else {
                                              Get.to(() => const HomeScreen());
                                              // controller.switchBool();
                                            }
                                          }
                                        }))
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
