import 'package:flutter/material.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_fonts.dart';
import '../../../../../core/utilities/style/app_colors.dart';
import '../../../../domain/entities/order/pending_order_entity.dart';
import 'action_button_widget.dart';

class OrderActionRow  extends StatelessWidget {
  final PendingOrderEntity pendingOrderEntity;
  const OrderActionRow({super.key, required this.pendingOrderEntity});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('EGP ${pendingOrderEntity.totalPrice} ',style: AppFonts.font14KBlackWeight600Font,
        ),
        ActionButtonWidget(title: context.localizations.reject, onPressed: (){}, backGroundColor: AppColors.kWhiteBase, textColor: AppColors.mainColor),
        ActionButtonWidget(title: context.localizations.accept, onPressed: (){},
            backGroundColor: AppColors.mainColor, textColor:  AppColors.kWhiteBase)],
    );
  }
}
