import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'components/animated_btn.dart';
import 'components/signin_showdialog.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _btnAnimationController;
  bool isSignInDialogShown = false;

  @override
  void initState() {
    super.initState();

    _btnAnimationController = OneShotAnimation("active", autoplay: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
              width: MediaQuery.of(context).size.width * 1.6,
              left: 100,
              bottom: 200,
              child: Image.asset("assets/Backgrounds/Spline.png")),
          Positioned.fill(
            child: BackdropFilter(filter: _addBlur(20, 10)),
          ),
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: _addBlur(30, 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isSignInDialogShown ? -50 : 0,
            duration: const Duration(milliseconds: 24),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      SizedBox(
                        width: 260,
                        child: Column(
                          children: [
                            _homePageTitle(),
                            const SizedBox(height: 16),
                            homePageText1()
                          ],
                        ),
                      ),
                      const Spacer(flex: 2),
                      AnimatedButton(
                        btnAnimationController: _btnAnimationController,
                        press: () {
                          _btnAnimationController.isActive = true;

                          Future.delayed(const Duration(milliseconds: 1200),
                              () {
                            setState(() {
                              isSignInDialogShown = true;
                            });
                            customSignInDialog(context, onClosed: (_) {
                              setState(() {
                                isSignInDialogShown = false;
                              });
                            });
                          });
                        },
                      ),
                      _homePageText2()
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }

  Text _homePageTitle() {
    return const Text(
      "Learn Design & Code",
      style: TextStyle(fontSize: 60, fontFamily: "Poppins", height: 1.2),
    );
  }

  Text homePageText1() {
    return const Text(
        "Don't skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools");
  }

  Padding _homePageText2() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Text(
          "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates "),
    );
  }

  ImageFilter _addBlur(double sigmaX, double sigmaY) =>
      ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY);
}
