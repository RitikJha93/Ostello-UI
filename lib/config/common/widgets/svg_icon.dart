import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatefulWidget {
  final String svgPath;
  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;

  const SvgIcon({
    super.key,
    required this.svgPath,
    this.isActive = false,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SvgIconState createState() => _SvgIconState();
}

class _SvgIconState extends State<SvgIcon> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      widget.svgPath, 
      // colorFilter: widget.isActive ? widget.activeColor : widget.inactiveColor,
      width: 24.0, // Customize size
      height: 24.0,
    );
  }
}
