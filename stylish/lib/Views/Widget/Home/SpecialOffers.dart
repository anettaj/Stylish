import 'package:flutter/material.dart';

import 'OutlineButton.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "Assets/Rectangle 48.png",
                category: "Now in (product)\nAll colours",
                numOfBrands: 18,
                press: () {},
                offer: '50-40% OFF',
              ),

              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
    required this.offer,
  }) : super(key: key);

  final String category, image,offer;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    double W= MediaQuery.of(context).size.width;
    double H= MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        width: W,
        height: H*0.3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),

              Positioned(
                left: 15,
                top: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('$offer',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: W*0.4,
                      child: Text('$category',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    OutlineButton(name: 'Shop Now',),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}