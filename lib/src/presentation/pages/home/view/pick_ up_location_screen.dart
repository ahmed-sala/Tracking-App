import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/src/presentation/managers/order/pick_up_location/pick_up_location_action.dart';
import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/dialogs/toast_dialoge.dart';
import '../../../managers/order/pick_up_location/pick_up_location_cubit.dart';
import '../../../managers/order/pick_up_location/pick_up_location_state.dart';
import '../widget/pick_up_location_widget/map_body_widget/no_location_permission_widget.dart';
import '../widget/pick_up_location_widget/pick_up_location_body_widget.dart';

class PickUpLocationScreen extends StatefulWidget {
  const PickUpLocationScreen({super.key});

  @override
  State<PickUpLocationScreen> createState() => _PickUpLocationScreenState();
}

class _PickUpLocationScreenState extends State<PickUpLocationScreen> {
  var pickUpLocationViewModel = getIt.get<PickUpLocationCubit>();

  @override
  void initState() {
    super.initState();
    pickUpLocationViewModel.doAction(
        pickedUpLocationAction: GetLocationUserDataAction());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => pickUpLocationViewModel,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.kWhiteBase,
            body: BlocConsumer<PickUpLocationCubit, PickUpLocationState>(
                listener: (context, state) =>
                    _handleBlocListenerPickUpLocation(state),
                builder: (context, state) =>
                    _handleBlocBuilderPickUpLocation(state))),
      ),
    );
  }

  Widget _handleBlocBuilderPickUpLocation(PickUpLocationState state) {
    if (state is GetLocationUserLoadingState) {
      return const Center(
          child: CircularProgressIndicator(
        color: Colors.yellow,
      ));
    } else if (state is GetLocationUserFailuresState ||
        !pickUpLocationViewModel.isPermissionLocationUser) {
      return NoLocationPermissionWidget(
        onPressed: () {
          pickUpLocationViewModel.doAction(
              pickedUpLocationAction: GetLocationUserDataAction());
        },
      );
    } else {
      return const PickUpLocationBodyWidget();
    }
  }

  void _handleBlocListenerPickUpLocation(PickUpLocationState state) {
    if (state is GetRoutesFailuresState) {
      ToastDialog.show(context.localizations.largeDistanceWarning);
    }
  }
}
