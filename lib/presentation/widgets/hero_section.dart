

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sohail_portfolio/core/constant/color_constant.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onContact;
  final VoidCallback onWork;
  const HeroSection({super.key,required this.onContact,required this.onWork});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with TickerProviderStateMixin  {
  late AnimationController _controller;
  late Animation<double> _animationX;
  late Animation<double> _animationY;
  late AnimationController _arrowController;
  late Animation<double> _arrowBounce;

  @override
  void initState() {
    super.initState();

    /// 🖼️ Image animation (slow float)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // Slow movement
    )..repeat(reverse: true);

    _animationX = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _animationY = Tween<double>(begin: -6, end: 6).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    /// ⬇️ Arrow animation (fast bounce)
    _arrowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800), // Fast bounce
    )..repeat(reverse: true);

    _arrowBounce = Tween<double>(begin: 0, end: 15).animate(
      CurvedAnimation(parent: _arrowController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _arrowController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;
        bool isTablet = constraints.maxWidth<1000;

        return Container(
          height: isMobile?MediaQuery.of(context).size.height*0.97:MediaQuery.of(context).size.height*0.95,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: (screenWidth * 0.08).clamp(16, 120),
          ),
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              colors: [ColorConstant.startColor, ColorConstant.endColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: isMobile
          ///  Mobile Layout
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTextContent(isMobile,onTouch: widget.onContact,onProject: widget.onWork),
              SizedBox(height: 40),
              _buildProfileImage(isMobile),
              SizedBox(height: 40),
              AnimatedBuilder(
                  animation: _arrowBounce,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _arrowBounce.value),
                      child: child,
                    );
                  },
                  child: Icon(Icons.keyboard_arrow_down,color: ColorConstant.whiteColor,)),

            ],
          )
          ///  Desktop / Web Layout
              : Stack(
                children: [
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 1400),
                      child: Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                      Expanded(child: _buildTextContent(isMobile,onTouch: widget.onContact,onProject: widget.onWork)),
                      _buildProfileImage(isMobile),
                                  ],
                                ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: AnimatedBuilder(
                        animation: _arrowBounce,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0, _arrowBounce.value),
                            child: child,
                          );
                        },
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: ColorConstant.whiteColor,
                          size: 35,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
        );
      },
    );
  }

  Widget _buildTextContent(bool isMobile,{required VoidCallback onTouch,required VoidCallback onProject}) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment:
      isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: isMobile ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment:
          isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Text(
              "Hi, I'm ",
              style: GoogleFonts.poppins(
                fontSize: (screenWidth * 0.035).clamp(24, 48),
                fontWeight: FontWeight.bold,
                color: ColorConstant.whiteColor,
              ),
            ),
            Text(
              "Sohail Khan",
              style: GoogleFonts.poppins(
                fontSize: (screenWidth * 0.035).clamp(24, 48),
                fontWeight: FontWeight.w500,
                color: ColorConstant.lightBlue,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Text(
          "Flutter Developer & Mobile App Specialist",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.poppins(
            fontSize: (screenWidth * 0.018).clamp(14, 22),
            color: ColorConstant.whiteColor,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Creating beautiful, performant cross-platform mobile applications with Flutter. "
              "Passionate about crafting seamless user experiences and bringing innovative ideas to life.",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.poppins(
            fontSize: (screenWidth * 0.014).clamp(12, 16),
            color: ColorConstant.whiteColor,
            height: 1.5,
          ),
        ),
        SizedBox(height: 30),
        if(!isMobile)
          Row(
            spacing: 20,
            children: [
              _roundedButton(
                  title: "Get In Touch",
                  icon: Icons.mail_outline,
                  onTap: onTouch,
                  titleColor: ColorConstant.startColor,
                  iconColor:ColorConstant.startColor,
                  backGroundColor: ColorConstant.whiteColor,
                  borderColor: ColorConstant.whiteColor),
              _roundedButton(
                  title: "View Projects",
                  icon: Icons.folder_open,
                  onTap: onProject,
                  titleColor: ColorConstant.whiteColor,
                  iconColor: ColorConstant.whiteColor,
                  backGroundColor: ColorConstant.startColor,
                  borderColor: ColorConstant.whiteColor),
            ],
          ),
        if(isMobile)
          _roundedButton(
              title: "Get In Touch",
              icon: Icons.mail_outline,
              onTap: onTouch,
              titleColor: ColorConstant.endColor,
              iconColor: ColorConstant.endColor,
              backGroundColor:ColorConstant.whiteColor,
              borderColor: ColorConstant.whiteColor),
        const SizedBox(height: 20,),
        if(isMobile)
        _roundedButton(
            title: "View Projects",
            icon: Icons.folder_open,
            onTap: onProject,
            titleColor: ColorConstant.whiteColor,
            iconColor: ColorConstant.whiteColor,
            backGroundColor: ColorConstant.endColor,
            borderColor: ColorConstant.whiteColor),
      ],
    );
  }

  Widget _buildProfileImage(bool isMobile) {
    double screenWidth = MediaQuery.of(context).size.width;

    double imageSize = (screenWidth * 0.18).clamp(200, 420);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(_animationX.value, _animationY.value),
            child: child,
          );
        },
        child: Container(
          width: imageSize,
          height: imageSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white54, width: 8),

            /// 3D Shadow Effect
            boxShadow: [
              BoxShadow(
                color: ColorConstant.blackColor.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(10, 10), // bottom-right shadow
              ),
              BoxShadow(
                color: ColorConstant.whiteColor.withOpacity(0.2),
                blurRadius: 15,
                offset: const Offset(-6, -6), // top-left light effect
              ),
            ],

            image: const DecorationImage(
              image: AssetImage("assets/images/sk2.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );

  }

Widget _roundedButton({
  required String title,
  required IconData icon,
  required VoidCallback onTap,
required Color titleColor,
required Color iconColor,
required Color backGroundColor,
required Color borderColor,
}){
  double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 45,
      child: ElevatedButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
        children: [
          Icon(icon,color: iconColor,),
         Text(title,style: GoogleFonts.poppins(fontSize: (screenWidth * 0.012).clamp(14, 18),color:titleColor ),),

        ],
      ),style: ElevatedButton.styleFrom(
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color:borderColor),
            borderRadius: BorderRadiusGeometry.circular(22),

          )
      ),),
    );
}
}

