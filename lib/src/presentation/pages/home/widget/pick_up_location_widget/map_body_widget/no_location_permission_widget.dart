
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/core/utilities/style/app_fonts.dart';

import '../../../../../../../core/common/common_imports.dart';
import '../../../../../../../core/utilities/style/spacing.dart';
import '../../../../../shared_widgets/custom_button_widget.dart';

class NoLocationPermissionWidget extends StatelessWidget {
  final void Function()? onPressed;
  const NoLocationPermissionWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return    Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.kWhiteBase,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.location_on,
                size: 48,
                color: Colors.redAccent,
              ),
              verticalSpace(16),
               Text(
                 context.localizations.enableLocationPermission,
                style:
                AppFonts.font18BlackWeight600Font,
              ),
              verticalSpace(8),
               Text(
                   context.localizations.locationPermissionMessage,
                   textAlign: TextAlign.center,
                style: AppFonts.font16kGrayWeight400Font
              ),
              verticalSpace(16),
              CustomButtonWidget(
                text:context.localizations.requestLocationPermission,
                onPressed: onPressed,
              ),
              verticalSpace(10),
              CustomButtonWidget(
                color: Colors.red,
                text:context.localizations.backToPreviousPage,
                onPressed:() =>  _navigateToBackScreen(context),
              )],
          ),
        ),
      ),
    );

  }

  void _navigateToBackScreen(BuildContext context){
    if(Navigator.canPop(context)){
      Navigator.pop(context);
    }
  }
}
