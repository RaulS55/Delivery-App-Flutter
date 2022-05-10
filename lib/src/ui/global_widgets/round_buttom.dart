import 'package:deliveryproyect/src/utils/colors.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButtom extends StatelessWidget {
  const RoundButtom({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgraundColor = primaryColor,
    this.border = false,
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 35),
  }) : super(key: key);
  final String label;
  final VoidCallback onPressed;
  final Color backgraundColor, textColor;
  final bool border;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: border ? Colors.black : primaryColor),
        borderRadius: BorderRadius.circular(30),
      ),
      child: CupertinoButton(
        child: Text(
          label,
          style: MyFontStyles.bottom.copyWith(color: textColor),
          textAlign: TextAlign.center,
        ),
        onPressed: onPressed,
        color: backgraundColor,
        borderRadius: BorderRadius.circular(30),
        padding: padding,
      ),
    );
  }
}
