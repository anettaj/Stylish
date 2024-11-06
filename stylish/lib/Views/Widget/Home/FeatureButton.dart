import 'package:flutter/material.dart';

class FeatureButton extends StatelessWidget {
  const FeatureButton({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Text(title),
            Icon(icon)
          ],
        )
    );
  }
}
