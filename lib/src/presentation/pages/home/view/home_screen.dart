import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_fonts.dart';
import 'package:tracking_app/src/data/api/core/errors/error_handler.dart';
import 'package:tracking_app/src/domain/entities/order/pending_order_entity.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/utilities/style/app_colors.dart';
import '../../../managers/order/pending_order/pending_order_cubit.dart';
import '../../../managers/order/pending_order/pending_order_event.dart';
import '../../../managers/order/start_order/start_order_cubit.dart';
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
  var startViewModel = getIt.get<StartOrderCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => pendingViewModel,
        ),
        BlocProvider(
          create: (context) => startViewModel,
        ),
      ],
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
            return _handleBlocBuilderState(
                state, context, pendingViewModel.pendingOrder);
          })),
    );
  }
}

Widget _handleBlocBuilderState(PendingOrderState state, BuildContext context,
    List<PendingOrderEntity> pendingOrder) {
  if (state is GetAllPendingOrderLoadingState) {
    return _buildLoadingState();
  } else if (state is GetAllPendingOrderErrorState) {
    return _buildErrorState(state.exception, context);
  } else {
    return _buildSuccessState(pendingOrder);
  }
}

Widget _buildSuccessState(List<PendingOrderEntity> pendingOrder) {
  if (pendingOrder.isNotEmpty) {
    return const PendingOrderBodyWidget();
  } else {
    return Center(
        child: Text(
      "No Orders",
      style: AppFonts.font20KMainWeight400Font,
    ));
  }
}

Widget _buildErrorState(Exception exceptions, BuildContext context) {
  return Center(
      child: GestureDetector(
    onTap: () =>
        context.read<PendingOrderCubit>().doAction(GetAllPendingOrderEvent()),
    child: Text(
      ErrorHandler.fromException(exceptions, context.localizations)
          .errorMessage,
      style: AppFonts.font20KMainWeight400Font,
      textAlign: TextAlign.center,
    ),
  ));
}

Widget _buildLoadingState() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}
