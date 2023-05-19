import 'package:fidelity_app/views/activate_account_text_form.dart';
import 'package:fidelity_app/views/qr_code_scanner_screen.dart';
import 'package:fidelity_app/widgets/outlined_awesome_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ActivateAccountScreen extends StatefulWidget {
  const ActivateAccountScreen({super.key});

  @override
  State<ActivateAccountScreen> createState() => _ActivateAccountScreenState();
}

class _ActivateAccountScreenState extends State<ActivateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title:const  Text(
                'Activation Method',
                style:
                    TextStyle(fontSize: 25, color: Colors.white, fontFamily: "Mont"),
              ),
              centerTitle: true,
              backgroundColor: Colors.black,
              leading: IconButton(
                  onPressed: () {
                    // Navigator.pop(context);

                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.transparent,
                  )),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                 
                  Row(
                    children: [
                      Expanded(
                          child: OutlineAwesomeButton(
                        onPressed: () {
                        
                         Get.to(()=>QrCodeScannerScreen());
                        },
                        text: "SCAN CODE QR",
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: OutlineAwesomeButton(
                        onPressed: () {
                        Get.to(()=>const ActivateAccountbyText());
                        },
                        text: "ENTER CODE MANUELLY",
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
  }
}