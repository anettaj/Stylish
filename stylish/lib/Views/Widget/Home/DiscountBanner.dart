import 'package:flutter/material.dart';

import '../../../Constant/Colors.dart';
import 'OutlineButton.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: bannerBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Deal of the Day',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.alarm, color: Colors.white,size: 20,),
                  SizedBox(width: 3),
                  Text(
                    '22h 55m 20s remaining',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14
                    ),
                  ),
                ],
              ),
            ],
          ),
          const OutlineButton(name: 'View all')
        ],
      ),
    );
  }
}