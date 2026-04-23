import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sohail_portfolio/core/constant/color_constant.dart';
import 'package:sohail_portfolio/core/constant/web_utils.dart';
import 'package:sohail_portfolio/presentation/widgets/ui_widgets/service_card.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
   PageController _pageController = PageController(viewportFraction:  0.32);
   int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.32,
      initialPage: _currentPage,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.whiteColor,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Services",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ColorConstant.blackColor,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Comprehensive Flutter development services to bring your mobile app ideas to life",
            textAlign: TextAlign.center,
            style: mTextStyle14( color: Colors.black54),
          ),
          SizedBox(height: 40),

          ///  Responsive Layout
          LayoutBuilder(
            builder: (context, constraints) {
              //  WEB/DESKTOP → Carousel
              if (constraints.maxWidth >= 800) {
                return Column(
                  children: [
                    SizedBox(
                      height: constraints.maxWidth > 1200
                          ? 420
                          : constraints.maxWidth > 800
                          ? 380
                          : 320,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                      CarouselSlider.builder(

                      itemCount: WebUtils.servicesData.length,
                        options: CarouselOptions(
                          enlargeFactor: 0.12,

                          height: constraints.maxWidth > 1200
                              ? 420
                              : constraints.maxWidth > 800
                              ? 380
                              : 320,

                          viewportFraction: constraints.maxWidth > 1200
                              ? 0.32
                              : constraints.maxWidth > 800
                              ? 0.5
                              : 0.85,

                          enlargeCenterPage: true, // 🔥 zoom effect
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),

                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                        ),
                        itemBuilder: (context, index, realIndex) {
                          final service = WebUtils.servicesData[index];

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: ServiceCard(
                              title: service["title"],
                              subTitle: service["subTitle"],
                              image: service["image"],
                              points: service['points'],
                            ),
                          );
                        },
                      )



                        ],
                      ),
                    ),

                    ///  Indicator
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        WebUtils.servicesData.length,
                            (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: _currentPage == index ? 12.w : 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? ColorConstant.endColor
                                : Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }

              //  MOBILE / TABLET → GridView
              else {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.42,
                  child: ListView.builder(
                    itemCount: WebUtils.servicesData.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final service = WebUtils.servicesData[index];
                      return Padding(
                        padding:  EdgeInsets.only(right: index == WebUtils.servicesData.length - 1 ? 14 : 0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75, // 👈 fixed width for horizontal list item
                          child: ServiceCard(
                            title: service["title"],
                            subTitle: service["subTitle"],
                            image: service["image"],
                            points: service['points'],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }

            },
          ),
        ],
      ),
    );
  }
}
