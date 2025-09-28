/*
import 'package:flutter/material.dart';

import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sohail_portfolio/core/constant/color_constant.dart';


class TechSection extends StatelessWidget {
  const TechSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // Title with fade
        FadeInUp(
          config: BaseAnimationConfig(
            delay: 300.ms,
            child: RichText(
              text: TextSpan(
                style: mTextStyle20(),
                children: [
                  const TextSpan(text: "Tools & "),
                  TextSpan(
                    text: "Technologies",
                    style: mTextStyle20(color: ColorConstant.accent),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 60),

        // -------- First Row: Slide from LEFT -------- //
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 88.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SlideInLeft(
                config: BaseAnimationConfig(
                  delay: 200.ms,
                  duration: 1000.ms,
                  child: Image.asset("assets/svg/flutter.png", height: 100, width: 100),
                ),
              ),
              SlideInLeft(
                config: BaseAnimationConfig(
                  delay: 200.ms,
                  duration: 1000.ms,
                  child: _techInfo(image: "assets/svg/Dart.svg"),
                ),
              ),
              SlideInLeft(
                config: BaseAnimationConfig(
                  delay: 300.ms,
                  duration: 1000.ms,
                  child: _techInfo(image: "assets/svg/java.svg"),
                ),
              ),
              SlideInRight(
                config: BaseAnimationConfig(
                  delay: 100.ms,
                  duration: 1000.ms,
                  child: _techInfo(image: "assets/svg/firbase.svg"),
                ),
              ),
              SlideInRight(
                config: BaseAnimationConfig(
                  delay: 200.ms,
                  duration: 1000.ms,
                  child: _techInfo(image: "assets/svg/Razorpay_logo.svg"),
                ),
              ),
              SlideInRight(
                config: BaseAnimationConfig(
                  delay: 300.ms,
                  duration: 1000.ms,
                  child: _techInfo(image: "assets/svg/android_studio.svg"),
                ),
              ),
            ],
          ),
        ),






        const SizedBox(height: 40),

        // -------- Bottom icons -------- //
        FadeInUp(
          config: BaseAnimationConfig(
            delay: 200.ms,
            duration: 1000.ms,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svg/github.svg", color: Colors.white, height: 60, width: 60),
                  const SizedBox(width: 40),
                  SvgPicture.asset("assets/svg/rest_api.svg", color: Colors.white, height: 60, width: 60),
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }

  // your tech image widget
  Widget _techInfo({required String image}) {
    return SvgPicture.asset(
      image,
      height: 60,
      width: 60,
    );
  }
}

*/
