import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/constants/app_sizes.dart';
import 'package:ageal/core/constants/validation.dart';
import 'package:ageal/dependency_injection.dart';
import 'package:ageal/presentation/cubit/login/login_cubit.dart';
import 'package:ageal/presentation/cubit/login/login_state.dart';
import 'package:ageal/presentation/widget/auth_widget/custom_row_create_account_text.dart';
import 'package:ageal/presentation/widget/custom/custom_loading.dart';
import 'package:ageal/presentation/widget/custom/custom_stack_scaffold.dart';
import 'package:ageal/presentation/widget/custom/popups/custom_flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/routing/routes.dart';
import '../../../../generated/l10n.dart';
import '../../../widget/auth_widget/custom_hint.dart';
import '../../../widget/auth_widget/custom_text_from_filed.dart';
import '../../../widget/custom/app_text.dart';
import '../../../widget/custom/deaful_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadedState) {
            const CustomLoading();
          } else if (state is LoginFauilreState) {
            showToast(message: state.errorMessage);
          } else if (state is LoginSuccessState) {
            showToast(message: S.current.successlogin);
            context.go(Routes.navBar);
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();
          return CustomStackScaffold(
            body: state is LoginLoadedState
                ? const CustomLoading()
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      child: Form(
                        key: cubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            height(heightSize(context) * 0.1),
                            Center(
                              child: DefaultText(
                                text: S.of(context).login,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            height(8),
                            Center(
                              child: DefaultText(
                                text: S.of(context).wellcomBack,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            height(heightSize(context) * 0.1),
                            //! Phone
                            CustomHint(text: S.of(context).phoneOrEmail),
                            height(4),
                            CustomTextFromFiled(
                              controller: cubit.phoneNumberController,
                              validator: (val) {
                                return Validations.phoneNumberVaildtor(
                                  cubit.phoneNumberController.text,
                                  context,
                                );
                              },
                              hintText: S.of(context).enterYourPhone,
                            ),
                            height(32),
                            //! password
                            CustomHint(text: S.of(context).password),
                            height(4),
                            CustomTextFromFiled(
                              obscureText: cubit.obscureText,
                              controller: cubit.passwordController,
                              validator: (val) {
                                return Validations.passwordVaildtor(
                                  cubit.passwordController.text,
                                  context,
                                );
                              },
                              hintText: S.of(context).enterPassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  cubit.changeObscureText();
                                },
                                icon: cubit.obscureText
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                              ),
                            ),
                            height(32),
                            DeafultButton(
                              width: double.maxFinite,
                              height: 44,
                              radius: 24,
                              title: S.of(context).login,
                              onPressed: () {
                                cubit.login();
                              },
                              containerColor: AppColors.kprimaryColor,
                            ),
                            height(32),
                            CustomRowCreateAccountText(
                              authText: S.of(context).createAccount,
                              haveAccount: S.of(context).haveAccount,
                              onTap: () {
                                context.go(Routes.register);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
