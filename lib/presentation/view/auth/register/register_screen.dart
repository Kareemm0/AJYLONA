import 'package:ageal/app/routing/routes.dart';
import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/constants/app_sizes.dart';
import 'package:ageal/dependency_injection.dart';
import 'package:ageal/presentation/cubit/register/register_cubit.dart';
import 'package:ageal/presentation/cubit/register/register_state.dart';
import 'package:ageal/presentation/widget/auth_widget/custom_row_create_account_text.dart';
import 'package:ageal/presentation/widget/custom/app_text.dart';
import 'package:ageal/presentation/widget/custom/custom_stack_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../generated/l10n.dart';
import '../../../widget/auth_widget/custom_gender_row.dart';
import '../../../widget/auth_widget/custom_register_form_fileds.dart';
import '../../../widget/custom/custom_loading.dart';
import '../../../widget/custom/deaful_button.dart';
import '../../../widget/custom/popups/custom_flutter_toast.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt()),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            const CustomLoading();
          } else if (state is RegisterFailureState) {
            showToast(message: state.errorMessage);
          } else if (state is RegisterSuccessState) {
            showToast(message: S.current.successSignUp);
            context.go(Routes.navBar);
          }
        },
        builder: (context, state) {
          final cubit = context.read<RegisterCubit>();
          return CustomStackScaffold(
            body: state is RegisterLoadingState
                ? const CustomLoading()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.go(Routes.navBar);
                            },
                            child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: DefaultText(
                                text: S.of(context).skip,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          height(16),
                          Center(
                            child: DefaultText(
                              text: S.of(context).createAccount,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          height(8),
                          DefaultText(
                            text: S.of(context).fillInfromation,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          height(32),
                          const CustomRegisterFromFileds(),
                          height(16),
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: DefaultText(
                              text: S.of(context).gender,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.kprimaryColor,
                            ),
                          ),
                          const CustomGenderRow(),
                          height(16),
                          DeafultButton(
                            radius: 24,
                            height: 44,
                            width: double.maxFinite,
                            containerColor: AppColors.kprimaryColor,
                            title: S.of(context).createAccount,
                            onPressed: () {
                              cubit.register(context);
                            },
                          ),
                          height(16),
                          CustomRowCreateAccountText(
                            haveAccount: S.of(context).dontHaveAccount,
                            authText: S.of(context).login,
                            onTap: () {
                              context.go(Routes.login);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
