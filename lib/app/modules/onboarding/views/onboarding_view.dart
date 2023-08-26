import 'package:ekomarket/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../src/constants/colors.dart';
import '../../../../src/constants/image_strings.dart';
import '../../../../src/constants/sizes.dart';
import '../../../../src/constants/text_strings.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: Alignment.center, children: [
      LiquidSwipe(
        liquidController: controller.controller,
        slideIconWidget: const Icon(Icons.arrow_back_ios),
        enableSideReveal: true,
        onPageChangeCallback: controller.onPageChangedCallback,
        pages: [
          Container(
            padding: const EdgeInsets.all(tDefaultSize),
            color: tOnboardingPage1Color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Image(image: AssetImage(tOnboardingImage1)),
                Column(
                  children: [
                    Text(
                      tOnboardingTitle1,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      tOnboardingSubTitle1,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
                Text(
                  tOnboardingCounter1,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 50.0,
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(tDefaultSize),
            color: tOnboardingPage2Color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Image(image: AssetImage(tOnboardingImage2)),
                Column(
                  children: [
                    Text(
                      tOnboardingTitle2,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      tOnboardingSubTitle2,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
                Text(
                  tOnboardingCounter2,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 50.0,
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(tDefaultSize),
            color: tOnboardingPage3Color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Image(image: AssetImage(tOnboardingImage3)),
                Column(
                  children: [
                    Text(
                      tOnboardingTitle3,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      tOnboardingSubTitle3,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
                Text(
                  tOnboardingCounter3,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 50.0,
                )
              ],
            ),
          ),
        ],
      ),
      Positioned(
        bottom: 60.0,
        child: OutlinedButton(
          onPressed: () => controller.animateToNextSlide(),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.black26),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            foregroundColor: Colors.white,
          ),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration:
                const BoxDecoration(color: tDarkColor, shape: BoxShape.circle),
            child: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
      Positioned(
        top: 50,
        right: 20,
        child: TextButton(
          onPressed: () => controller.skip(),
          child: const Text("Skip", style: TextStyle(color: Colors.grey)),
        ),
      ),
      Obx(() => Positioned(
          bottom: 10,
          child: AnimatedSmoothIndicator(
            activeIndex: controller.currentPage.value,
            count: 3,
            effect: const WormEffect(
              activeDotColor: Color(0xff272727),
              dotHeight: 5.0,
            ),
          )))
    ]));
  }
}
