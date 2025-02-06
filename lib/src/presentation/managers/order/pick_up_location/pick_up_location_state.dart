sealed class PickUpLocationState {}
class PickedLocationInitialState extends PickUpLocationState{}
class GetLocationUserLoadingState extends PickUpLocationState{}
class GetLocationUserSuccessState extends PickUpLocationState{}
class GetLocationUserFailuresState extends PickUpLocationState{
  final String errorMassage;
  GetLocationUserFailuresState({required this.errorMassage});
}
class GetRoutesLoadingState extends PickUpLocationState{}
class GetRoutesSuccessState extends PickUpLocationState{}
class GetRoutesFailuresState extends PickUpLocationState{
  final String errorMassage;
  GetRoutesFailuresState({required this.errorMassage});
}