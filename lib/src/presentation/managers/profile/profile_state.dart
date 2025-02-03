part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class GetProfileDataLoadingState extends ProfileState {}

class GetProfileDataSuccessState extends ProfileState {}

class GetProfileDataFailuresState extends ProfileState {
  final Exception exception;
  GetProfileDataFailuresState({required this.exception});
}

class LogOutSuccessState extends ProfileState {}

class LogOutFailuresState extends ProfileState {
  final Exception exception;
  LogOutFailuresState({required this.exception});
}

class LogOutLoadingState extends ProfileState {}
