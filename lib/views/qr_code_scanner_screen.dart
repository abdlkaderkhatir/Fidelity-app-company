import 'dart:io';
import 'package:fidelity_app/controllers/local_controller.dart';
import 'package:fidelity_app/routes/routes.dart';
import 'package:fidelity_app/services/cardService.dart';
import 'package:flutter/foundation.dart';
import 'package:fidelity_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScannerScreen extends StatefulWidget {
  const QrCodeScannerScreen({super.key});

  @override
  State<QrCodeScannerScreen> createState() => _QrCodeScannerScreenState();
}

class _QrCodeScannerScreenState extends State<QrCodeScannerScreen> {
  Barcode? result;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool error = false;
  bool scanning = false;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (mounted) {
        if (!scanning) {
          scanning = true;
          
            
          // int parsedData = int.parse(scanData.code!.toString());
          String parsedData = scanData.code!.toString();
        
          if (scanData.code != null) {
            addCards(int.parse(parsedData));
          } else {
            print('Invalid QR code data: ${scanData.code}');
          }
        }
      }
    });
  }

  addCards(int idStore) async {
    var response = await CardService.addCard(idStore);
    if (!response.error) {
      Get.toNamed(Routes.homeScreen);
    } else {
      error = true;
      // print(LocalController.getToken());
      Get.back();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: mainColor,
                  borderRadius: 2,
                  borderLength: 30,
                  borderWidth: 2,
                  // cutOutSize: scanArea
                ),
                // onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
              )),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  : const Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }
}
