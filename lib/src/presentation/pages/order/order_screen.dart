import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_icons.dart';
import 'package:tracking_app/src/data/api/core/errors/error_handler.dart';
import 'package:tracking_app/src/presentation/managers/order/all_driver_orders/all_driver_orders_viewmodel.dart';
import 'package:tracking_app/src/presentation/pages/order/widgets/order_item.dart';
import 'package:tracking_app/src/presentation/pages/order/widgets/state_container.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/utilities/style/spacing.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key});

  AllDriverOrdersViewmodelCubit allDriverOrdersViewmodelCubit =
      getIt<AllDriverOrdersViewmodelCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.localization.myOrders,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => allDriverOrdersViewmodelCubit,
        child: BlocBuilder<AllDriverOrdersViewmodelCubit, AllDriverOrdersState>(
          builder: (context, state) {
            if (state is AllDriverOrdersInitial) {
              allDriverOrdersViewmodelCubit.getAllDriverOrders();
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AllDriverOrdersLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AllDriverOrdersLoaded) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        StateContainer(
                            title: context.localization.canceled,
                            value: allDriverOrdersViewmodelCubit
                                .numberOfCanceledOrders
                                .toString(),
                            icon: AppIcons.cancelIcon),
                        horizontalSpace(34),
                        StateContainer(
                            title: context.localization.completed,
                            value: allDriverOrdersViewmodelCubit
                                .numberOfCompletedOrders
                                .toString(),
                            icon: AppIcons.completedIcon),
                      ],
                    ),
                    verticalSpace(16),
                    Text(context.localization.recentOrders,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        )),
                    verticalSpace(24),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => verticalSpace(24),
                        itemBuilder: (context, index) {
                          return OrderItem(
                            pendingOrderEntity: allDriverOrdersViewmodelCubit
                                .allDriverOrdersEntity.orders![index].store!,
                            userEntity: allDriverOrdersViewmodelCubit
                                .allDriverOrdersEntity
                                .orders![index]
                                .order!
                                .user!,
                            orderEntity: allDriverOrdersViewmodelCubit
                                .allDriverOrdersEntity.orders![index].order!,
                          );
                        },
                        itemCount: allDriverOrdersViewmodelCubit
                            .allDriverOrdersEntity.orders!.length,
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is AllDriverOrdersError) {
              var errorMessage = ErrorHandler.fromException(
                  state.exception, context.localization);
              return Center(
                child: Text(errorMessage.errorMessage),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
