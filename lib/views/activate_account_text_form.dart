import 'package:fidelity_app/routes/routes.dart';
import 'package:fidelity_app/services/cardService.dart';
import 'package:fidelity_app/widgets/outlined_awesome_button.dart';
import 'package:fidelity_app/widgets/text_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ActivateAccountbyText extends StatefulWidget {
  const ActivateAccountbyText({super.key});

  @override
  State<ActivateAccountbyText> createState() => _ActivateAccountbyTextState();
}

class _ActivateAccountbyTextState extends State<ActivateAccountbyText> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Activer le compte",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Code d`activation',
                      style: TextStyle(
                        fontFamily: "DIN",
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextForm(
                          // icon: const Icon(Icons.send ,color: mainColor,size: 25,),
                          text: "Enter le code",
                          controller: codeController,
                          validator: (value) {
                            // if (value.toString().length <= 2) {
                            //   return 'Enter valid code';
                            // } else {
                            //   return null;
                            // }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: OutlineAwesomeButton(
                              onPressed: () async {

                              },
                              text: "ACTIVER LE COMPTE",
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
