import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_fonts.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/utilities/style/app_colors.dart';
import '../../../managers/order/pending_order/pending_order_cubit.dart';
import '../../../managers/order/pending_order/pending_order_event.dart';
import '../widget/pending_order_body_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    pendingViewModel.doAction(GetAllPendingOrderEvent());
    super.initState();
  }

  var pendingViewModel = getIt.get<PendingOrderCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => pendingViewModel,
        child: Scaffold(
            backgroundColor: AppColors.kWhiteBase,
            appBar: AppBar(
              backgroundColor: AppColors.kWhiteBase,
              title: Text(
                context.localizations.floweryRider,
                style: AppFonts.font20KMainWeight400Font,
              ),
            ),
            body: BlocBuilder<PendingOrderCubit, PendingOrderState>(
                builder: (context, state) {
              if (state is GetAllPendingOrderLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetAllPendingOrderErrorState) {
                return const Center(child: Text("Error"));
              } else {
                return const PendingOrderBodyWidget();
              }
            })));
  }
}
