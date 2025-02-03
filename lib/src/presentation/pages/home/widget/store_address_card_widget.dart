import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_fonts.dart';
import 'package:tracking_app/src/domain/entities/order/all_driver_orders_entity.dart';

import '../../../../../core/utilities/style/app_colors.dart';
import '../../../../../core/utilities/style/spacing.dart';
import '../../../../domain/entities/order/pending_order_entity.dart';
import 'custom_info_card_widget.dart';

class StoreAddressCardWidget extends StatelessWidget {
  final StoreOrderEntity? storeOrderEntity;
  final StoreEntity? storeEntity;
  const StoreAddressCardWidget(
      {super.key, this.storeOrderEntity, this.storeEntity});

  @override
  Widget build(BuildContext context) {
    print("StoreOrderEntity: ${storeOrderEntity?.image}");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localizations.pickupAddress,
          style: AppFonts.font12KGrayWeight400Font,
        ),
        verticalSpace(8.h),
        CustomInfoCard(
          subtitle: storeOrderEntity == null
              ? storeEntity?.address ?? ""
              : storeOrderEntity?.address ?? "",
          icon: Icons.location_on_outlined,
          title: storeOrderEntity == null
              ? storeEntity?.name ?? ""
              : storeOrderEntity?.name ?? "",
          imageUrl: storeOrderEntity == null
              ? storeEntity?.image ?? ""
              : storeOrderEntity?.image ?? "",
          backgroundColor: AppColors.kWhiteBase,
          subtitleColor: AppColors.kBlackBase,
          titleColor: AppColors.kGray,
        ),
      ],
    );
  }
}
