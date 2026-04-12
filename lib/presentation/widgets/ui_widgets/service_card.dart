import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constant/color_constant.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final List<String> points;

  const ServiceCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.points,
  });

  double getFont(BuildContext context, double size) {
    double width = MediaQuery.of(context).size.width;
    return size * (width / 1400).clamp(0.75, 1.1);
  }

  double getImageSize(double width) {
    if (width > 1200) return 90;
    if (width > 800) return 75;
    return 60;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final imgSize = getImageSize(width);

    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.blackColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(3, 3),
          ),
        ],
      ),

      /// 🔥 FIX: Equal height feel
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE
          Center(
            child: CircleAvatar(
              radius: imgSize / 1.6,
              backgroundColor: Colors.blue.shade50,
              child: Image.asset(
                image,
                height: imgSize,
                width: imgSize,
              ),
            ),
          ),

          const SizedBox(height: 14),

          /// TITLE
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: getFont(context, 18),
              color: ColorConstant.blackColor,
            ),
          ),

          const SizedBox(height: 8),

          /// SUBTITLE
          Text(
            subTitle,
            maxLines: 3, // 🔥 control height
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: getFont(context, 14),
              color: Colors.black87,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 10),

          /// POINTS (LIMITED)
          ...points.take(3).map( // 🔥 max 3 points only
                (e) => Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(Icons.circle, size: 5),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      e,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: getFont(context, 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// 🔥 Fill space for equal height feel
          const Spacer(),
        ],
      ),
    );
  }
}