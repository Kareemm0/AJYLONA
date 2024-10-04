import 'package:ageal/domain/entity/auth/user_entity.dart';

abstract class RegisterState {}

class RegisterInitalState extends RegisterState {}

class ChangePasswordObsecureText extends RegisterState {}

class ChangeConfirmPasswordObsecureText extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final UserEntity userEntity;

  RegisterSuccessState(this.userEntity);
}

class RegisterFailureState extends RegisterState {
  final String errorMessage;

  RegisterFailureState(this.errorMessage);
}

class ChangeGenderState extends RegisterState {}

class SelectedDateState extends RegisterState {
  final DateTime selectedTime;

  SelectedDateState({required this.selectedTime});
}
