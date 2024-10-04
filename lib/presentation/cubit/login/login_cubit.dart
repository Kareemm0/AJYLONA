import 'package:ageal/core/service/auth_manager.dart';
import 'package:ageal/presentation/cubit/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/shared/shared_prefrence.dart';
import '../../../domain/repo/auth/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitialState());

  final LoginRepo loginRepo;

  AppSharedPrefrences? appSharedPrefrences;

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool obscureText = false;

  void changeObscureText() {
    obscureText = !obscureText;
    emit(ChangeObscureTextState());
  }

  Future<void> login() async {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      emit(LoginLoadedState());
      final result = await loginRepo.login(
        phone: phoneNumberController.text,
        password: passwordController.text,
      );
      result.fold(
        (failure) {
          emit(
            LoginFauilreState(failure.message),
          );
        },
        (result) async {
          await AuthenticationManager().setToken(result.token);
          //print("==================================${result.token}");
          emit(LoginSuccessState(result));
        },
      );
    }
  }
}
