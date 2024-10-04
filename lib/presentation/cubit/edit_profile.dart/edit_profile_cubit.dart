import 'package:ageal/domain/entity/auth/user.dart';
import 'package:ageal/domain/repo/profile/user_data_repo.dart';
import 'package:ageal/presentation/cubit/edit_profile.dart/edit_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final UserDataRepo settingRepo;
  UserDataCubit({required this.settingRepo}) : super(UserDataInitial());
  Future<void> getUserData() async {
    final response = await settingRepo.getUserData();
    response.fold((failure) {
      emit(GetDataFailure(failureMessage: failure.message));
    }, (userData) {
      emit(GetDataSuccess(userData: userData));
    });
  }

  Future<void> updateUserData({
    String? name,
    String? phoneNumber,
    String? email,
    String? pic,
    String? date,
    String? gender,
  }) async {
    final UserDataEntity user = (state as GetDataSuccess).userData;
    final response = await settingRepo.updateUserData(
        name: name,
        phoneNumber: phoneNumber,
        email: email,
        pic: pic,
        date: date,
        gender: gender);
    response.fold((failure) {
      emit(UpdateDataFailure(failureMessage: failure.message, userData: user));
    }, (successMessage) {
      emit(UpdateDataSuccess(
          updatedSuccess: successMessage,
          userData: (state as GetDataSuccess).userData.copyWith(
              name: name,
              email: email,
              picture: pic,
              birthdate: date,
              gender: gender)));
    });
  }

  Future<void> deleteProfile() async {
    final UserDataEntity user = (state as GetDataSuccess).userData;

    final response = await settingRepo.deleteProfile();
    response.fold((failure) {
      emit(UpdateDataFailure(failureMessage: failure.message, userData: user));
    }, (successMessage) {
      emit(DeletedSuccess(deletedSuccess: successMessage, userData: user));
    });
  }
}
