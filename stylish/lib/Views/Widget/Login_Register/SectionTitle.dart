import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.W, required this.title,
  });

  final double W;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13),
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: W*0.5,
          child: Text(title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

