import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:tracking_app/src/presentation/managers/order/pick_up_location/pick_up_location_action.dart';
import 'package:tracking_app/src/presentation/managers/order/pick_up_location/pick_up_location_state.dart';

import '../../../../../core/common/apis/api_result.dart';
import '../../../../../core/service/location_manger/location_manger.dart';
import '../../../../../core/service/open_route_servie/open_route_service_api.dart';

@injectable
class PickUpLocationCubit extends Cubit<PickUpLocationState> {
  LocationManger locationManger;
  OpenRouteServiceApi openRouteServiceApi;
  PickUpLocationCubit(this.locationManger, this.openRouteServiceApi)
      : super(PickedLocationInitialState());

  bool _isPermissionLocationUser = false;
  double ecommerceLatitude = 30.0121661;
  double ecommerceLongitude = 31.3043625;
  double userLongitude = 0;
  double userLatitude = 0;
  List<LatLng> routesPoint = [];

  Future<void> doAction(
      {required PickUpLocationAction pickedUpLocationAction}) async {
    switch (pickedUpLocationAction) {
      case GetLocationUserDataAction():
        return await _getLocationUserData();
    }
  }

  bool get isPermissionLocationUser => _isPermissionLocationUser;
  List<LatLng> get xroutesPoint => routesPoint;
  Future<void> _getLocationUserData() async {
    try {
      emit(GetLocationUserLoadingState());
      _isPermissionLocationUser =
          await locationManger.canGetLocationPermission();
      if (_isPermissionLocationUser) {
        LocationData locationData = await locationManger.getLocationUser();
        userLatitude = locationData.latitude ?? 0.0;
        userLongitude = locationData.longitude ?? 0.0;
        emit(GetLocationUserSuccessState());
        _getRoutes();
      } else {
        emit(GetLocationUserFailuresState(
            errorMassage: "please User Open Location "));
      }
    } catch (e) {
      emit(GetLocationUserFailuresState(errorMassage: e.toString()));
    }
  }

  Future<void> _getRoutes() async {
    emit(GetRoutesLoadingState());
    routesPoint = [];
    var result = await openRouteServiceApi.getRouteMaps(
        startLat: userLatitude,
        startLog: userLongitude,
        endLat: ecommerceLatitude,
        endLog: ecommerceLongitude);
    switch (result) {
      case Success<List<LatLng>>():
        routesPoint = result.data ?? [];
        emit(GetRoutesSuccessState());
      case Failures<List<LatLng>>():
        routesPoint = [];
        emit(GetRoutesFailuresState(errorMassage: result.exception.toString()));
    }
  }
}
