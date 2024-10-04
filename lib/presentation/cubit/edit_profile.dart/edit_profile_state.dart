

import 'package:ageal/domain/entity/auth/user.dart';
import 'package:equatable/equatable.dart';

sealed class UserDataState extends Equatable {
  const UserDataState();

  @override
  List<Object> get props => [];
}

final class UserDataInitial extends UserDataState {}

final class GetDataLoading extends UserDataState {}

final class GetDataSuccess extends UserDataState {
  final UserDataEntity userData;
  const GetDataSuccess({required this.userData});

  @override
  List<Object> get props => [userData, identityHashCode(this)];
}

final class GetDataFailure extends UserDataState {
  final String failureMessage;
  const GetDataFailure({required this.failureMessage});
}

final class UpdateDataSuccess extends GetDataSuccess {
  final String updatedSuccess;

  const UpdateDataSuccess(
      {required this.updatedSuccess, required super.userData});
}

final class UpdateDataFailure extends GetDataSuccess {
  final String failureMessage;

  const UpdateDataFailure(
      {required this.failureMessage, required super.userData});
}

final class DeletedSuccess extends GetDataSuccess {
  final String deletedSuccess;

  const DeletedSuccess({required this.deletedSuccess, required super.userData});
}

final class DeleteFailure extends GetDataSuccess {
  final String failureMessage;
  const DeleteFailure({required this.failureMessage, required super.userData});
}
