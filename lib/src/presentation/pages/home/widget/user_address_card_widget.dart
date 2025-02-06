import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_fonts.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';
import 'package:tracking_app/src/domain/entities/order/all_driver_orders_entity.dart';

import '../../../../../core/utilities/style/app_colors.dart';
import '../../../../domain/entities/order/pending_order_entity.dart';
import 'custom_info_card_widget.dart';

class UserAddressCardWidget extends StatelessWidget {
  final UserOrderEntity? userOrderEntity;
  final UserEntity? userEntity;
  final bool isUser;
  const UserAddressCardWidget(
      {super.key, this.userOrderEntity, this.userEntity, this.isUser = false});

  @override
  Widget build(BuildContext context) {
    print('https://flower.elevateegy.com/uploads/${userEntity?.photo}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localizations.userAddress,
          style: AppFonts.font12KGrayWeight400Font,
        ),
        verticalSpace(8.h),
        CustomInfoCard(
          subtitle: userOrderEntity == null
              ? userEntity?.phone ?? ""
              : userOrderEntity?.phone ?? "",
          icon: Icons.phone,
          title: userOrderEntity == null
              ? userEntity?.firstName ?? ""
              : userOrderEntity?.firstName ?? "",
          imageUrl: isUser
              ? 'https://flower.elevateegy.com/uploads/${userEntity?.photo}' ??
                  ""
              : 'https://flower.elevateegy.com/uploads/${userOrderEntity?.photo}' ??
                  "",
          backgroundColor: AppColors.kWhiteBase,
          subtitleColor: AppColors.kBlackBase,
          titleColor: AppColors.kGray,
          isUser: true,
        ),
      ],
    );
  }
}
