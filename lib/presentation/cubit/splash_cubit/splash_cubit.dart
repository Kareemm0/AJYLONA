import 'package:ageal/app/routing/routes.dart';
import 'package:ageal/presentation/cubit/splash_cubit/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/service/auth_manager.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitialState());

  void spalshNavigation(BuildContext ctx) async {
    final token = await AuthenticationManager().getToken();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        token == null ? ctx.go(Routes.register) : ctx.go(Routes.navBar);
      },
    );
  }
}
