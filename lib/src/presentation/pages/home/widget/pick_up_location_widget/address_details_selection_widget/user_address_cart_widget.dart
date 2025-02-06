import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/src/domain/entities/order/pending_order_entity.dart';
import 'package:tracking_app/src/presentation/pages/home/widget/pick_up_location_widget/address_details_selection_widget/custom_info_address_card_widget.dart';

import '../../../../../../../core/common/common_imports.dart';
import '../../../../../../../core/service/url_lancher_packege/open_application_factory.dart';
import '../../../../../../../core/utilities/style/app_fonts.dart';
import '../../../../../../../core/utilities/style/spacing.dart';

class UserAddressCartWidget extends StatelessWidget {
  final UserOrderEntity userOrderEntity;
  const UserAddressCartWidget({super.key, required this.userOrderEntity});

  @override
  Widget build(BuildContext context) {
    print("${userOrderEntity.photo} zz" );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(context.localizations.userAddress, style: AppFonts.font12KGrayWeight400Font),
        verticalSpace(8),
        CustomInfoAddressCardWidget(
          imageUrl:"https://flower.elevateegy.com/uploads/${userOrderEntity.photo ?? ""}" ,
          title: userOrderEntity.firstName ?? "",
          address: userOrderEntity.phone ?? "",
          onPhoneClick: () =>ClickApplicationFactory.getClickApplication(application: Application.phone).openClickApplication(phone: userOrderEntity.phone ?? "011545443334"),
          onWhatsappIcon: () =>ClickApplicationFactory.getClickApplication(application: Application.whats).openClickApplication(phone: userOrderEntity.phone ?? "011545443334"),
          backgroundColor: AppColors.kWhiteBase,
        ),
      ],
    );
  }
}
