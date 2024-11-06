import 'package:flutter/material.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final Widget icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 13),
        decoration: BoxDecoration(
            color: const Color(0xFFF5F6F9),
            border: Border.all(
                color: Colors.pink
            ),
            borderRadius: const BorderRadius.all(Radius.circular(30))
        ),
        child: icon,
      ),
    );
  }
}
