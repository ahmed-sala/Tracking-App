import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_fonts.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';
import '../../../../../core/utilities/style/app_colors.dart';
import '../../../../domain/entities/order/pending_order_entity.dart';
import 'custom_info_card_widget.dart';

class UserAddressCardWidget extends StatelessWidget {
  final  UserOrderEntity userOrderEntity;
  const UserAddressCardWidget({super.key, required this.userOrderEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.localizations.userAddress,
          style: AppFonts.font12KGrayWeight400Font,),
        verticalSpace(8.h),
        CustomInfoCard(
          subtitle: userOrderEntity.phone ?? "",
          icon: Icons.phone,
          title: userOrderEntity.firstName ?? "",
          imageUrl: "https://flower.elevateegy.com/uploads/${userOrderEntity.photo ?? ""}" ,
          backgroundColor:   AppColors.kWhiteBase,
          subtitleColor: AppColors.kBlackBase,
          titleColor: AppColors.kGray,

        ),
      ],
    );
  }
}
