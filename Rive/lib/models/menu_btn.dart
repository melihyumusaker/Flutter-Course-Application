
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MenuBtn extends StatelessWidget {
  const MenuBtn({
    Key? key,
    required this.press,
    required this.riveonInit,
  }) : super(key: key);

  final VoidCallback press;
  final ValueChanged<Artboard> riveonInit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SafeArea(
          child: Container(
        margin:const EdgeInsets.only(left: 16, top: 16),
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 3), blurRadius: 8)
            ]),
        child: RiveAnimation.asset(
          "assets/RiveAssets/menu_button.riv",
          onInit: riveonInit,
        ),
      )),
    );
  }
}
