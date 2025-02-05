import 'package:tracking_app/src/presentation/pages/home/view/order_details_screen.dart';
import 'package:tracking_app/src/presentation/pages/home/widget/pick_up_location_widget/address_details_selection_widget/pick_up_address_cart_widget.dart';
import 'package:tracking_app/src/presentation/pages/home/widget/pick_up_location_widget/address_details_selection_widget/user_address_cart_widget.dart';

import '../../../../../../../core/common/common_imports.dart';
import '../../../../../../../core/utilities/style/app_colors.dart';
import '../../../../../../../core/utilities/style/spacing.dart';

class AddressDetailsSelectionWidget extends StatelessWidget {
  const AddressDetailsSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ArgumentPickUpRoutesScreen argumentPickUpRoutesScreen=ModalRoute.of(context)?.settings.arguments as ArgumentPickUpRoutesScreen;
    return     Container(
      color: AppColors.kWhiteBase,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              width: 65.w,
              height: 5.h,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(4)),
            ),
          ),
          verticalSpace(24),
           Builder(builder: (context) {
            if(argumentPickUpRoutesScreen.isClickUserOrder){
              return Column(
                children: [
                  PickUpAddressCartWidget(storeOrderEntity: argumentPickUpRoutesScreen.storeOrderEntity,),
                  verticalSpace(24),
                  UserAddressCartWidget(userOrderEntity: argumentPickUpRoutesScreen.userOrderEntity,),
                ],
              );
            }else{
              return Column(
                children: [
                  UserAddressCartWidget(userOrderEntity: argumentPickUpRoutesScreen.userOrderEntity,),
                  verticalSpace(24),
                  PickUpAddressCartWidget(storeOrderEntity: argumentPickUpRoutesScreen.storeOrderEntity,),

                ],
              );
            }
           },)
        ],
      ),
    );
  }
}
