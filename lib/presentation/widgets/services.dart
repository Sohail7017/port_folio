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
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

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
                      height: MediaQuery.of(context).size.height*0.68,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          PageView.builder(
                            controller: _pageController,
                            itemCount: WebUtils.servicesData.length,
                            onPageChanged: (index) {
                              setState(() => _currentPage = index);
                            },
                            itemBuilder: (context, index) {
                              final service = WebUtils.servicesData[index];
                              return Center(   // 👈 Center align
                                child: SizedBox(
                                  width: 500,

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


                          /// Left Arrow
                          Positioned(
                            left: MediaQuery.of(context).size.width/9,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                _pageController.previousPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              },
                            ),
                          ),

                          /// Right Arrow
                          Positioned(
                            right: MediaQuery.of(context).size.width/9,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_forward_ios),
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              },
                            ),
                          ),
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
                  height: 480,
                  child: ListView.builder(
                    itemCount: WebUtils.servicesData.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final service = WebUtils.servicesData[index];
                      return Padding(
                        padding:  EdgeInsets.only(right: index == WebUtils.servicesData.length - 1 ? 14 : 0),
                        child: SizedBox(
                          width: 360, // 👈 fixed width for horizontal list item
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
