import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_icons.dart';
import 'package:tracking_app/src/domain/entities/order/all_driver_orders_entity.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/app_colors.dart';
import '../../../../../core/utilities/style/app_fonts.dart';
import '../../../../../core/utilities/style/spacing.dart';
import '../../home/widget/store_address_card_widget.dart';
import '../../home/widget/user_address_card_widget.dart';

class OrderItem extends StatelessWidget {
  const OrderItem(
      {super.key,
      required this.pendingOrderEntity,
      required this.userEntity,
      required this.orderEntity});
  final StoreEntity pendingOrderEntity;
  final UserEntity userEntity;
  final OrderEntity orderEntity;
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
            Row(
              children: [
                Row(
                  children: [
                    orderEntity.state != 'Completed'
                        ? SvgPicture.asset(AppIcons.completedIcon)
                        : SvgPicture.asset(AppIcons.cancelIcon),
                    horizontalSpace(4),
                    Text(
                      orderEntity.state!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: orderEntity.state != 'Completed'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  orderEntity.orderNumber!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            verticalSpace(16),
            StoreAddressCardWidget(
              storeEntity: pendingOrderEntity,
            ),
            verticalSpace(16),
            UserAddressCardWidget(userEntity: userEntity, isUser: true),
            verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
