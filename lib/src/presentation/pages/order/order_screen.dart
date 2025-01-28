import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/src/presentation/managers/order/order_viewmodel.dart';

import '../../../../core/common/common_imports.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderViewModel orderViewModel = getIt<OrderViewModel>();
    return Scaffold(
      body: BlocProvider(
        create: (context) => orderViewModel,
        child: Center(
            child: InkWell(
          onTap: () {
            orderViewModel.putData();
          },
          child: const Text(
            "Ahamd Slahe  OrderScreen ",
            style: TextStyle(fontSize: 40),
          ),
        )),
      ),
    );
  }
}
