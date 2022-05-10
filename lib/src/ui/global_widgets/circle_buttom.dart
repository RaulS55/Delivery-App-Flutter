import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleButtom extends StatelessWidget {
  const CircleButtom({
    Key? key,
    required this.onPressed,
    required this.iconPath,
    this.size = 45,
    required this.backgraundColor,
    required this.iconColor,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String iconPath;
  final double size;
  final Color backgraundColor, iconColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        child: Container(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            "assets/pages/welcome/$iconPath.svg",
            color: iconColor,
          ),
          width: size,
          height: size,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgraundColor,
          ),
        ),
        onPressed: onPressed);
  }
}
