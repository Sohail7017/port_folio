import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sohail_portfolio/core/constant/color_constant.dart';
import 'package:sohail_portfolio/core/constant/web_utils.dart';
import 'package:sohail_portfolio/presentation/widgets/tech_section.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(

      color: ColorConstant.lightGrey,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: isMobile?15: 50.0,vertical: 30),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Text(
              "About Me",
              style: isMobile? mTextStyle20(fontWeight: FontWeight.bold): GoogleFonts.poppins(fontSize: 30,fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 22),
            Text(
              "Passionate Flutter developer crafting high-quality, innovative mobile applications with a focus on performance and user experience.",
              style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500 ),textAlign: TextAlign.center,
            ),

            const SizedBox(height: 28),
            isMobile
                ? Column(
              children: [
                _buildImage(context,isMobile),
                const SizedBox(height: 20),
                _buildContent(context),
              ],
            )
                : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 2, child: _buildImage(context,isMobile)),
                const SizedBox(width: 30),
                Expanded(flex: 3, child: _buildContent(context)),
              ],
            ),
            const SizedBox(height: 40,),

          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context,bool isMobile) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: isMobile?320:400,

        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorConstant.blackColor.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Image.network(
          "https://images.unsplash.com/photo-1551650975-87deedd944c3?w=600&h=400&fit=crop",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

         Text(
          "${WebUtils.firstPara}",  style: mTextStyle16(),
        ),
        const SizedBox(height: 24),
         Text(
          "${WebUtils.secondPara}",  style: mTextStyle16(),
        ),
        const SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2/ 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 30,
          ),
          itemCount: WebUtils.techImages.length,
          itemBuilder: (_, index) {
            return _techInfo(image: WebUtils.techImages[index]);
          },
        )


      ],
    );
  }
  Widget _techInfo({required String image}) {
    return SvgPicture.asset(
      image,
    );
  }
}


