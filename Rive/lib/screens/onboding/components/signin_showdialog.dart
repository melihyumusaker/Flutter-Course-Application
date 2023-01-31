import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import "signIn.dart";

Future<Object?> customSignInDialog(BuildContext context,
    {required ValueChanged onClosed}) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "Sign In",
    context: context,
    transitionDuration: const Duration(milliseconds: 600),
    transitionBuilder: (_, animation, __, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.linearToEaseOut)),
        child: child,
      );
    },
    pageBuilder: (context, _, __) => Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        height: 620,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.94),
          borderRadius: const BorderRadius.all(Radius.circular(40)),
        ),
        child: Scaffold(
          
            backgroundColor: Colors.transparent,
            body: Stack(
              
              children: [
                Column(
                  children: [
                    _formTitle(),
                    _formContent(),
                    const SignInForm(),
                    Row(
                      children: const [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "OR",
                            style: TextStyle(color: Colors.black26),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        "Sign up with Email, Apple or Google ",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/email_box.svg",
                              height: 64,
                              width: 64,
                            )),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/apple_box.svg",
                              height: 64,
                              width: 64,
                            )),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/google_box.svg",
                              height: 64,
                              width: 64,
                            )),
                      ],
                    )
                  ],
                ),
                const Positioned(
                    bottom: -49,
                    left: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ))
              ],
            )),
      ),
    ),
  ).then((onClosed));
}

Padding _formContent() {
  return const Padding(
    padding: EdgeInsets.symmetric(vertical: 16),
    child: Text(
        "Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.",
        textAlign: TextAlign.center),
  );
}

Text _formTitle() {
  return const Text(
    "Sign In",
    style: TextStyle(fontSize: 34, fontFamily: "Poppins"),
  );
}
