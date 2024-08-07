import 'package:chatapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IntroductionView'),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Title of first page",
            body:
                "Welcome to the app! This is a description on a page with a blue background.",
            image: Container(
              width: Get.width * 0.6,
              height: Get.height * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/main-laptop-duduk.json"),
              ),
            ),
          ),
          PageViewModel(
            title: "Title of second page",
            body:
                "Welcome to the app! This is a description on a page with a blue background.",
            image: Container(
              width: Get.width * 0.6,
              height: Get.height * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/ojek.json"),
              ),
            ),
          ),
          PageViewModel(
            title: "Title of third page",
            body:
                "Welcome to the app! This is a description on a page with a blue background.",
            image: Container(
              width: Get.width * 0.6,
              height: Get.height * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/payment.json"),
              ),
            ),
          ),
          PageViewModel(
            title: "Title of fourth page",
            body:
                "Welcome to the app! This is a description on a page with a blue background.",
            image: Container(
              width: Get.width * 0.6,
              height: Get.height * 0.6,
              child: Center(
                child: Lottie.asset("assets/lottie/register.json"),
              ),
            ),
          ),
        ],
        onDone: () {
          Get.offAllNamed(Routes.LOGIN);
        },
        // onSkip: () {},
        showSkipButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        next: const Text(
          "Next",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        done: const Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
