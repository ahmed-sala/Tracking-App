import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/src/presentation/managers/order/order_details/order_details_state.dart';
import 'package:tracking_app/src/presentation/managers/order/order_details/order_details_viewmodel.dart';

import '../../../../../core/common/common_imports.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderDetailsViewmodel orderDetailsViewmodel =
        getIt<OrderDetailsViewmodel>();
    return BlocProvider(
      create: (context) => orderDetailsViewmodel,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order Details'),
        ),
        body: BlocBuilder<OrderDetailsViewmodel, OrderDetailsState>(
          builder: (context, state) {
            if (state is OrderDetailsLoading) {
              // orderDetailsViewmodel.getOrderDetails();
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is OrderDetailsLoaded ||
                state is OrderDetailsInitial) {
              return Column(
                children: [
                  InkWell(
                      onTap: () {
                        orderDetailsViewmodel.getOrderDetails();
                      },
                      child: Text('Order Details')),
                ],
              );
            } else if (state is OrderDetailsError) {
              return Center(
                child: Text(state.message),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
