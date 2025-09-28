/*
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/constant/color_constant.dart';

class HoverMenuItem extends StatefulWidget {
  final String title;
  final int delayMs;

  const HoverMenuItem({super.key, required this.title, required this.delayMs});

  @override
  State<HoverMenuItem> createState() => _HoverMenuItemState();
}

class _HoverMenuItemState extends State<HoverMenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 12)),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
        ),
        onPressed: () {},
        child: Text(
          widget.title,
          style: mTextStyle16().copyWith(
            color: isHovered ?ColorConstant.hoverColor : ColorConstant.whiteColor,
            decoration: isHovered ? TextDecoration.underline : TextDecoration.none,
            decorationColor:ColorConstant.hoverColor,
            decorationThickness: 1.5,
            decorationStyle: TextDecorationStyle.solid,
            height: 1.8,
          ),
        ),
      ).animate(
        delay: widget.delayMs.ms,
      ).slide(
        begin: const Offset(-1, 0),
        duration: 900.ms,
      ).fadeIn(
        duration: 800.ms,
      ),
    );
  }
}
*/
