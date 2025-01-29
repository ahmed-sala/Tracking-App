import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_fonts.dart';
import '../../../../../core/utilities/style/app_colors.dart';
import '../../../../../core/utilities/style/spacing.dart';
import '../../../../domain/entities/order/pending_order_entity.dart';
import 'custom_info_card_widget.dart';

class StoreAddressCardWidget extends StatelessWidget {
  final StoreOrderEntity storeOrderEntity;
  const StoreAddressCardWidget({super.key, required this.storeOrderEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.localizations.pickupAddress,
          style: AppFonts.font12KGrayWeight400Font,),
        verticalSpace(8.h),
        CustomInfoCard(
          subtitle: storeOrderEntity.address ?? "",
          icon: Icons.location_on_outlined,
          title: storeOrderEntity.name ?? "",
          imageUrl: storeOrderEntity.image ?? "",
          backgroundColor:   AppColors.kWhiteBase,
          subtitleColor: AppColors.kBlackBase,
          titleColor: AppColors.kGray,

        ),
      ],
    );
  }
}
