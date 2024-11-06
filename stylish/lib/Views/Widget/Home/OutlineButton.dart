import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({
    super.key, required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
            color: Colors.white
        ),
      ),
      child: Row(
        children: [
          Text(name,
            style: TextStyle(
                color: Colors.white
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(Icons.arrow_forward,color: Colors.white,size: 16,)
        ],
      ),
    );
  }
}
