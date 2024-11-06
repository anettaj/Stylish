import 'package:flutter/material.dart';

import '../../../Constant/Colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double W= MediaQuery.of(context).size.width;
    double H= MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
              backgroundColor: MenuBgIconColor,
              child: Icon(Icons.sort_rounded,color: MenuIconColor,)
          ),
          const SizedBox(width: 16),
          Image.asset('Assets/logo.png',
            height: 30,
            width: W*0.5,
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            foregroundImage: AssetImage('Assets/avatar.png'),
          )
        ],
      ),
    );
  }
}
