import 'package:flutter/material.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
    required this.text,
    required this.linkText,
    required this.link,
  }) : super(key: key);

  final String text;
  final String linkText;
  final VoidCallback link;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(color: Color(0xFF757575)),
        ),
        GestureDetector(
          onTap: link,
          child: Text(
            linkText,
            style: const TextStyle(
                color: Colors.pink,
                fontSize: 14,
                decorationColor: Colors.pink,
                decoration: TextDecoration.underline
            ),

          ),
        ),
      ],
    );
  }
}
