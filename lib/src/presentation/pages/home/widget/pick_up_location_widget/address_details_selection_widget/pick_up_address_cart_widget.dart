import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/src/domain/entities/order/pending_order_entity.dart';
import 'package:tracking_app/src/presentation/pages/home/widget/pick_up_location_widget/address_details_selection_widget/custom_info_address_card_widget.dart';

import '../../../../../../../core/common/common_imports.dart';
import '../../../../../../../core/service/url_lancher_packege/open_application_factory.dart';
import '../../../../../../../core/utilities/style/app_fonts.dart';
import '../../../../../../../core/utilities/style/spacing.dart';

class PickUpAddressCartWidget extends StatelessWidget {
  final StoreOrderEntity storeOrderEntity;
  const PickUpAddressCartWidget({super.key, required this.storeOrderEntity});

  @override
  Widget build(BuildContext context) {
    print("${storeOrderEntity.image}  ");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          context.localizations.pickUpAddress,
            style:AppFonts.font12KGrayWeight400Font
        ),
        verticalSpace(8),
        CustomInfoAddressCardWidget(
          imageUrl: storeOrderEntity.image ?? "",
          title: storeOrderEntity.name ?? "Order ",
          address: storeOrderEntity.address ?? "Order ",
          onPhoneClick: () =>ClickApplicationFactory.getClickApplication(application: Application.phone).openClickApplication(phone: storeOrderEntity.phoneNumber ?? "011545443334"),
          onWhatsappIcon: () =>ClickApplicationFactory.getClickApplication(application: Application.whats).openClickApplication(phone: storeOrderEntity.phoneNumber ?? "011545443334"),
          backgroundColor: const Color(0xFFF9F9F9),
        ),
      ],
    );
  }
}
