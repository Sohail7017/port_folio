import 'package:flutter/material.dart';
import 'package:sohail_portfolio/core/constant/color_constant.dart';

class WebAppBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onAboutTap;
  final VoidCallback? onServicesTap;
  final VoidCallback? onProjectsTap;
  final VoidCallback? onContactTap;

  const WebAppBar({
    super.key,
    this.onHomeTap,
    this.onAboutTap,
    this.onServicesTap,
    this.onProjectsTap,
    this.onContactTap,
  });

  @override
  State<WebAppBar> createState() => _WebAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _WebAppBarState extends State<WebAppBar> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return AppBar(
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      backgroundColor: ColorConstant.whiteColor,
      elevation: 0,
      centerTitle: true,
      leadingWidth: 150,

      leading:  Padding(
        padding: EdgeInsets.only(top: 15.0, left: 20),
        child: RichText(
          text: TextSpan(
            style: mTextStyle22(

              fontWeight: FontWeight.bold,

            ),
            children: [
              TextSpan(
                text: "Sohail",
                style: mTextStyle22(color: ColorConstant.endColor /*Color(0xff02569B)*/),
              ),
              TextSpan(
                text: "Dev",
                style: mTextStyle22(color: ColorConstant.blackColor),
              ),
            ],
          ),
        ),
      ),

      title: width > 800
          ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildMenuItem("Home", widget.onHomeTap),
          _buildMenuItem("About", widget.onAboutTap),
          _buildMenuItem("Services", widget.onServicesTap),
          _buildMenuItem("Projects", widget.onProjectsTap),
          _buildMenuItem("Contact", widget.onContactTap),
        ],
      )
          : null,

      actions: [
        if (width > 800)
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstant.endColor,
                shape: const StadiumBorder(),
              ),
              onPressed: widget.onContactTap,
              child:  Text(
                "Hire Me",
                style: mTextStyle12(color: ColorConstant.whiteColor),
              ),
            ),
          )
        else
        // Actions me (mobile case)
          PopupMenuButton<String>(
            color: ColorConstant.whiteColor,
            offset: const Offset(0, kToolbarHeight), // dropdown ko niche shift karega
            constraints: const BoxConstraints(minWidth: 220), // width bada
            icon: Icon(
              _isMenuOpen ? Icons.close : Icons.menu,
              color: ColorConstant.blackColor.withOpacity(0.8),
            ),
            onSelected: (value) {
              switch (value) {
                case "Home":
                  widget.onHomeTap?.call();
                  break;
                case "About":
                  widget.onAboutTap?.call();
                  break;
                case "Services":
                  widget.onServicesTap?.call();
                  break;
                case "Projects":
                  widget.onProjectsTap?.call();
                  break;
                case "Contact":
                  widget.onContactTap?.call();
                  break;
              }
            },
            itemBuilder: (BuildContext context) => [
              _buildDropdownMenuItem("Home"),
              _buildDropdownMenuItem("About"),
              _buildDropdownMenuItem("Services"),
              _buildDropdownMenuItem("Projects"),
              _buildDropdownMenuItem("Contact"),

              // Hire Me button
              _buildDropdownHireMeButton(),
            ],
          )


      ],


    );
  }

  Widget _buildMenuItem(String text, VoidCallback? onTap) {
    bool isHovered = false; // builder ke bahar

    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          cursor: SystemMouseCursors.click,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              onTap: onTap,
              child: Text(
                text,
                style: mTextStyle16(
                  color: isHovered ? ColorConstant.endColor/*const Color(0xff02569B)*/ : ColorConstant.blackColor.withOpacity(0.9),
                  fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  PopupMenuItem<String> _buildDropdownMenuItem(String text) {
    bool isHovered = false;

    return PopupMenuItem<String>(
      value: text,
      child: StatefulBuilder(
        builder: (context, setState) {
          return MouseRegion(
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            cursor: SystemMouseCursors.click,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
                color: isHovered ? ColorConstant.endColor/*const Color(0xff02569B)*/ : ColorConstant.blackColor.withOpacity(0.9),
              ),
            ),
          );
        },
      ),
    );
  }

  PopupMenuItem<String> _buildDropdownHireMeButton() {
    return PopupMenuItem<String>(
      enabled: false, // disable item so only button works
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstant.endColor,
          shape: const StadiumBorder(),
        ),
        onPressed: widget.onContactTap,
        child:  Text(
          "Hire Me",
          style: mTextStyle14(color: ColorConstant.whiteColor),
        ),
      ),
    );
  }


}
