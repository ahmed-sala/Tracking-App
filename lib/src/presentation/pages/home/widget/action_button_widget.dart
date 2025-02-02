import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionButtonWidget extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Color backGroundColor;
  final Color textColor;
  const ActionButtonWidget(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.backGroundColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed:onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backGroundColor,
            padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 24.w)),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 14.sp, fontWeight: FontWeight.w500, color: textColor),
        ));
  }
}
