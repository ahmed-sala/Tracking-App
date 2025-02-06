import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/routes/page_route_name.dart';
import 'package:tracking_app/core/utilities/style/app_fonts.dart';
import 'package:tracking_app/core/utilities/style/app_icons.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';
import 'package:tracking_app/src/presentation/managers/order/pick_up_location/pick_up_location_state.dart';
import 'package:tracking_app/src/presentation/managers/order/success_order/success_order_action.dart';
import 'package:tracking_app/src/presentation/managers/order/success_order/success_order_cubit.dart';
import 'package:tracking_app/src/presentation/shared_widgets/custom_button_widget.dart';

import '../../../../../core/helpers/shared_pref/shared_pref_keys.dart';

class SuccessOrderScreen extends StatefulWidget {
  const SuccessOrderScreen({super.key});

  @override
  State<SuccessOrderScreen> createState() => _SuccessOrderScreenState();
}

class _SuccessOrderScreenState extends State<SuccessOrderScreen> {
  var successOrderViewModel =
  getIt.get<SuccessOrderCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => successOrderViewModel,
      child: Scaffold(
        body: BlocListener<SuccessOrderCubit, SuccessOrderState>(
          listener: (context, state) {
            if(state is RemoveOrderSuccessState){
               goNextSectionAppScreen(context: context);
            }},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppIcons.successOrder,
                  width: 150.w,
                  height: 160.h,
                ),
                verticalSpace(10),
                Text(context.localizations.thankYou,
                    style: AppFonts.font24GreenWeightW500Font),
                verticalSpace(5),
                Text(context.localizations.theOrderWasDeliveredSuccessfully,
                    textAlign: TextAlign.center,
                    style: AppFonts.font24KBlackWeightW500Font),
                verticalSpace(48),
                CustomButtonWidget(
                    text: context.localizations.done,
                    onPressed: () {
                      successOrderViewModel.doAction(successOrderAction: RemoveOrderIdAction(orderId: SharedPrefKeys.orderId));
                    })
              ],

            ),
          ),
        ),
      ),
    );
  }

  void goNextSectionAppScreen({required BuildContext context}) {
    Navigator.pushNamedAndRemoveUntil(
      context, PageRoutesName.section, (route) => false,);
  }
}
