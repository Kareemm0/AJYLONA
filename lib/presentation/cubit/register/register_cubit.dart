import 'package:ageal/core/service/auth_manager.dart';
import 'package:ageal/domain/entity/auth/user_entity.dart';
import 'package:ageal/presentation/cubit/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/shared/shared_prefrence.dart';
import '../../../domain/repo/auth/register_repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitalState());

  AppSharedPrefrences? appSharedPrefrences;
  UserEntity? userEntity;

  final RegisterRepo registerRepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureTextone = false;

  bool obscureTexttwo = false;

  final formKey = GlobalKey<FormState>();

  String? selectedOption;

  DateTime? selectedDate;

  Future<void> register(context) async {
    final isVaild = formKey.currentState!.validate();
    if (isVaild) {
      emit(RegisterLoadingState());
      final response = await registerRepo.register(
        name: nameController.text,
        phone: phoneNumberController.text,
        password: passwordController.text,
        email: emailController.text,
        geneder: selectedOption!,
      );
      response.fold((failure) {
        emit(RegisterFailureState(failure.message));
      }, (result) async {
        await AuthenticationManager().setToken(result.token);

        emit(RegisterSuccessState(result));
      });
    }
  }

  void changeObscureTextPassword() {
    obscureTextone = !obscureTextone;
    emit(ChangePasswordObsecureText());
  }

  void changeObscureTextConfirmPassword() {
    obscureTexttwo = !obscureTexttwo;
    emit(ChangeConfirmPasswordObsecureText());
  }

  void changeGender(String? val) {
    selectedOption = val!;
    emit(ChangeGenderState());
  }

  Future<void> selectedDatePicker(ctx) async {
    final DateTime? pickedDate = await showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime(2030),
    );
    if (pickedDate != selectedDate!) {
      selectedDate = pickedDate!;
      emit(SelectedDateState(selectedTime: selectedDate!));
    }
  }
}
