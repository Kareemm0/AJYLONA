import 'package:ageal/core/constants/validation.dart';
import 'package:ageal/core/extensions/extensions.dart';
import 'package:ageal/presentation/cubit/register/register_cubit.dart';
import 'package:ageal/presentation/cubit/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../generated/l10n.dart';
import 'custom_hint.dart';
import 'custom_text_from_filed.dart';

class CustomRegisterFromFileds extends StatelessWidget {
  const CustomRegisterFromFileds({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        //final appCubit = context.read<DatePickerCubit>();
        final cubit = context.read<RegisterCubit>();
        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! name
              CustomHint(text: S.of(context).name),
              height(4),
              CustomTextFromFiled(
                controller: cubit.nameController,
                textInputAction: TextInputAction.next,
                validator: (val) {
                  return Validations.displayNameValidator(
                    cubit.nameController.text,
                    context,
                  );
                },
              ),
              //!EmailFiled
              height(16),
              CustomHint(text: S.of(context).email),
              height(4),
              CustomTextFromFiled(controller: cubit.emailController),
              height(16),
              //! Phone Filed
              CustomHint(text: S.of(context).phone),
              height(4),
              CustomTextFromFiled(
                controller: cubit.phoneNumberController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                validator: (val) {
                  return Validations.phoneNumberVaildtor(
                    cubit.phoneNumberController.text,
                    context,
                  );
                },
              ),
              height(16),
              //! Age
              CustomHint(text: S.of(context).age),
              CustomTextFromFiled(
                controller: TextEditingController(),
                hintText: cubit.selectedDate == null
                    ? "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"
                    : "${cubit.selectedDate!.day}/${cubit.selectedDate!.month}/${cubit.selectedDate!.year}",
                enabled: false,
              ).onTap(() {
                cubit.selectedDatePicker(context);
              }),
              height(16),
              //! Password
              CustomHint(text: S.of(context).password),
              height(4),
              CustomTextFromFiled(
                controller: cubit.passwordController,
                validator: (val) {
                  return Validations.passwordVaildtor(
                    cubit.passwordController.text,
                    context,
                  );
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    cubit.changeObscureTextPassword();
                  },
                  icon: cubit.obscureTextone
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
                textInputAction: TextInputAction.next,
              ),
              height(16),
            ],
          ),
        );
      },
    );
  }
}
