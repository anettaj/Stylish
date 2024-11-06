import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Constant/BrandIcon.dart';
import 'SocialCard.dart';

class BrandIcon extends StatelessWidget {
  const BrandIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialCard(
          icon: SvgPicture.string(googleIcon,height: 25,),
          press: () {},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SocialCard(
            icon: SvgPicture.string(appleIcon,height: 25),
            press: () {},
          ),
        ),

      ],
    );
  }
}

