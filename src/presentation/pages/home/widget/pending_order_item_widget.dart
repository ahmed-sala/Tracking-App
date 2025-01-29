import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_fonts.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';
import 'package:tracking_app/src/presentation/pages/home/widget/store_address_card_widget.dart';
import 'package:tracking_app/src/presentation/pages/home/widget/user_address_card_widget.dart';
import '../../../../../core/utilities/style/app_colors.dart';
import '../../../../domain/entities/order/pending_order_entity.dart';
import 'order_action_row _widget.dart';

class PendingOrderItemWidget extends StatelessWidget {
  final PendingOrderEntity pendingOrderEntity;
  const PendingOrderItemWidget({super.key, required this.pendingOrderEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: AppColors.kWhiteBase,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              context.localizations.flowerOrder,
              style: AppFonts.font14KBlackWeight500Font,
            ),
            verticalSpace(16),
            StoreAddressCardWidget(
              storeOrderEntity: pendingOrderEntity.storeOrderEntity!,
            ),
            verticalSpace(16),
            UserAddressCardWidget(
                userOrderEntity: pendingOrderEntity.userOrderEntity!),
            verticalSpace(16),
            OrderActionRow(pendingOrderEntity: pendingOrderEntity),
          ],
        ),
      ),
    );
  }
}
