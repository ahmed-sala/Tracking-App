import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/core/utilities/style/images/cached_network_image%20_widget.dart';
class CustomInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final IconData icon;
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;

  const CustomInfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.icon,
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.black,
    this.subtitleColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow:  [
          BoxShadow(
            color: Color(0x53535340).withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w,
            vertical: 8.h),
       leading: Container(
         clipBehavior: Clip.antiAlias,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(50.r),
         ),
         child: CachedNetworkImageWidget(
             fit: BoxFit.cover,
             imageUrl: "https://flower.elevateegy.com/uploads/$imageUrl", width: 44, height: 44),
       ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: titleColor,
              ),
            ),
            Row(
              children: [
                Icon(
                  icon,
                  size: 16.sp,
                  color: titleColor,
                ),
                SizedBox(width: 4.w),
                Flexible(
                  child: Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: subtitleColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
