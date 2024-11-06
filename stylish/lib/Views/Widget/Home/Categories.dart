import 'package:flutter/material.dart';
import '../../../Constant/Colors.dart';
import 'FeatureButton.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"image": 'Assets/category/Beauty.png', "text": "Beauty"},
      {"image": 'Assets/category/fashion.png', "text": "Fashion"},
      {"image": 'Assets/category/kids.png', "text": "Kids"},
      {"image": 'Assets/category/mens.png', "text": "Mens"},
      {"image": 'Assets/category/womens.png', "text": "Women"},
    ];
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child:Text('All Featured',style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),)
            ),
            Row(
              children: [
                FeatureButton(title: 'Sort', icon: Icons.swap_vert,),
                FeatureButton(title: 'Filter', icon: Icons.filter_alt_outlined,),

              ],
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              categories.length,
                  (index) => CategoryCard(
                image: categories[index]["image"],
                text: categories[index]["text"],
                press: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.image,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String image, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Image.asset(image),
          const SizedBox(height: 4),
          Text(text, textAlign: TextAlign.center,style: TextStyle(color: categoryCardTextColor,fontSize: 12),)
        ],
      ),
    );
  }
}
