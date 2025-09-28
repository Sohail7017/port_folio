import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HoverLiftWidget extends StatefulWidget {
  final Widget child;
  const HoverLiftWidget({super.key, required this.child});

  @override
  State<HoverLiftWidget> createState() => _HoverLiftWidgetState();
}

class _HoverLiftWidgetState extends State<HoverLiftWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: 300.ms,
        transform: isHovered ? Matrix4.translationValues(0, -8, 0) : Matrix4.identity(),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}
