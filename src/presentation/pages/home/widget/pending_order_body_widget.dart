import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/src/presentation/pages/home/widget/pending_order_list_widget.dart';

class PendingOrderBodyWidget extends StatelessWidget {
  const PendingOrderBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
        padding: EdgeInsets.symmetric(
            vertical: 16.0.h, horizontal: 16.0.w),
        child: const PendingOrderListWidget());
  }

}
