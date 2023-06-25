import 'package:fidelity_app/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();   
  // await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, devicetype) {
       SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
      ));
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Mont',
          primarySwatch: Colors.green,
          // secondaryHeaderColor: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: Colors.white,
        ),
        initialRoute: Routes.splashScreen,
        getPages: AppRoutes.routes,
      );
    });
  }
}

