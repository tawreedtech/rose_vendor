import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rose_vendor/helper/network_info.dart';
import 'package:rose_vendor/features/auth/controllers/auth_controller.dart';
import 'package:rose_vendor/features/splash/controllers/splash_controller.dart';
import 'package:rose_vendor/main.dart';
import 'package:rose_vendor/utill/app_constants.dart';
import 'package:rose_vendor/utill/dimensions.dart';
import 'package:rose_vendor/utill/images.dart';
import 'package:rose_vendor/utill/styles.dart';
import 'package:rose_vendor/features/auth/screens/auth_screen.dart';
import 'package:rose_vendor/features/dashboard/screens/dashboard_screen.dart';
import 'package:rose_vendor/features/splash/widgets/splash_painter_widget.dart';

class SplashScreen extends StatefulWidget {


  const SplashScreen({Key? key,}) : super(key: key);
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    initCall();
  }

  Future<void> initCall() async {
    NetworkInfo.checkConnectivity(context);
    Provider.of<SplashController>(context, listen: false).initConfig().then((bool isSuccess) {
      if(isSuccess) {
        Provider.of<SplashController>(context, listen: false).initShippingTypeList(context,'');
        Timer(const Duration(seconds: 1), () async {
          if (Provider.of<AuthController>(context, listen: false).isLoggedIn()) {
           await Provider.of<AuthController>(context, listen: false).updateToken(context);
            Navigator.of(Get.context!).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const DashboardScreen()));
          } else {
            Navigator.of(Get.context!).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const AuthScreen()));
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        clipBehavior: Clip.none, children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: CustomPaint(
            painter: SplashPainterWidget(),
          ),
        ),

        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                  tag:'logo',
                  child: Image.asset(Images.whiteLogo, height: 80.0,
                      fit: BoxFit.cover, width: 80.0)),
              const SizedBox(height: Dimensions.paddingSizeExtraLarge,),
              Text(AppConstants.appName, style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeWallet,
                  color: Colors.white),
              ),
            ],
          ),
        ),
      ],
      )
    );
  }

}
