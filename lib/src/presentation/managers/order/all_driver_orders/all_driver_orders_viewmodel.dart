import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/order/all_driver_orders_entity.dart';
import 'package:tracking_app/src/domain/use_cases/order/all_driver_orders_usecase.dart';

part 'all_driver_orders_state.dart';

@injectable
class AllDriverOrdersViewmodelCubit extends Cubit<AllDriverOrdersState> {
  AllDriverOrdersUsecase _allDriverOrdersUsecase;
  AllDriverOrdersViewmodelCubit(this._allDriverOrdersUsecase)
      : super(AllDriverOrdersInitial());
  AllDriverOrdersEntity allDriverOrdersEntity = AllDriverOrdersEntity();
  int numberOfCompletedOrders = 10;
  int numberOfCanceledOrders = 10;

  void getAllDriverOrders() async {
    emit(AllDriverOrdersLoading());
    final result = await _allDriverOrdersUsecase.call();
    switch (result) {
      case Success<AllDriverOrdersEntity>():
        numberOfCanceledOrders = (result.data?.orders ?? [])
            .where((element) => element.order?.state == "Canceled")
            .length;
        numberOfCanceledOrders = (result.data?.orders ?? [])
            .where((element) => element.order?.state == "Completed")
            .length;
        allDriverOrdersEntity = result.data!;
        emit(AllDriverOrdersLoaded(result.data));
      case Failures<AllDriverOrdersEntity>():
        emit(AllDriverOrdersError(result.exception));
    }
  }
}
