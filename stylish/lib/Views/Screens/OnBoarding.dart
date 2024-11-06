import 'package:onboarding_animation/onboarding_animation.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController controller = PageController();
  int currentPage = 0;



  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double H = MediaQuery.of(context).size.height;
    double W = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: OnBoardingAnimation(
          indicatorSwapType: SwapType.normal,
          pages: [
            onboardingPage(
              currentPage: currentPage,
              W: W,
              image: 'Assets/fashion shop-rafiki 1.png',
              title: 'Choose Products',
              description:
              'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
            ),
            onboardingPage(
              currentPage: currentPage+1,
              W: W,
              image: 'Assets/Sales consulting-pana 1.png',
              title: 'Make Payment',
              description:
              'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
            ),
            onboardingPage(
              currentPage: currentPage+2,
              W: W,
              image: 'Assets/Shopping bag-rafiki 1.png',
              title: 'Get Your Order',
              description:
              'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
              isLastPage: true,
            ),
          ],
          controller: controller,
          indicatorDotHeight: 7.0,
          indicatorDotWidth: 7.0,
          indicatorType: IndicatorType.expandingDots,
          indicatorExpansionFactor: 4,
          indicatorPosition: IndicatorPosition.bottomCenter,
        ),
      ),
    );
  }

  Widget onboardingPage({
    required int currentPage,
    required double W,
    required String image,
    required String title,
    required String description,
    bool isLastPage = false,
  }) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${currentPage + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      const TextSpan(
                        text: '/3',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(isLastPage ? '' : 'Skip'),
              ),
            ],
          ),
          Column(
            children: [
              Image.asset(image),
              const SizedBox(height: 15,),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                width: W * 0.67,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              currentPage!=0
                  ? Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 10),
                    child: InkWell(
                      onTap: (){
                        controller.previousPage(duration: Duration(microseconds: 8), curve: Curves.easeIn);
                      },
                        child: const Text('Prev',style: TextStyle(color: Colors.grey),)
                    ),
                  )
                  :const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.only(right: 15,bottom: 10),
                child: isLastPage
                  ? InkWell(
                  onTap: (){

                  },
                  child: Text('Get Started'),
                  )
                    :InkWell(
                  onTap: (){
                    controller.nextPage(duration: Duration(microseconds: 8), curve: Curves.easeIn);
                  },
                  child: Text('Next'),
                )

              ),
            ],
          ),
        ],
      ),
    );
  }
}
