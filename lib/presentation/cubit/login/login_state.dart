import 'package:ageal/domain/entity/auth/user_entity.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class ChangeObscureTextState extends LoginState {}

class LoginLoadedState extends LoginState {}

class LoginFauilreState extends LoginState {
  final String errorMessage;

  LoginFauilreState(this.errorMessage);
}

class LoginSuccessState extends LoginState {
  final UserEntity userEntity;

  LoginSuccessState(this.userEntity);
}
