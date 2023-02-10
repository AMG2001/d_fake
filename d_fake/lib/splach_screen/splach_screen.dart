import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:d_fake/config/user_data_model/user_data_model.dart';
import 'package:d_fake/login_screen/login_screen.dart';
import 'package:d_fake/main.dart';
import 'package:d_fake/register_page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class SplachScreenCustom extends StatelessWidget {
  SplachScreenCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      // time in milli seconds
      duration: 2000,
      /**
       * Fade Animation Duration
       */
      animationDuration: Duration(seconds: 1),
      /**
       * Centeralize image
       */
      centered: true,
      splashIconSize: Get.height,
      splash: Container(
        /**
         * make image take the width of the screen
         */
        width: Get.width,
        /**
         * make image take the height of the screen
         */
        height: Get.height,
        decoration: BoxDecoration(color: Colors.black
            //   image: DecorationImage(
            //     image: AssetImage(
            //         'assets/images/splach_screen_images/splach_image.jpg'),
            //     fit: BoxFit.cover,
            //     /**
            //      * Add darl layer on the image
            //      */
            //   ),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera,
              color: Colors.white,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "D_Fake",
              style: TextStyle(color: Colors.white, fontSize: 24),
            )
          ],
        ),
      ),
      nextScreen: UserDataModel.userLoggedIn ? MainPage() : LoginScreen(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
/**
 * 
 */
