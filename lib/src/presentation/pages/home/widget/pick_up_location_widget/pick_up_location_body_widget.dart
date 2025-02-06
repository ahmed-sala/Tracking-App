import '../../../../../../core/common/common_imports.dart';
import 'address_details_selection_widget/address_details_selection_widget.dart';
import 'map_body_widget/map_body_widget.dart';

class PickUpLocationBodyWidget extends StatelessWidget {
  const PickUpLocationBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MapBodyWidget(),
        AddressDetailsSelectionWidget(),
      ],
    );
  }
}
