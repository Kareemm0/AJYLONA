import 'package:ageal/app/routing/app_routing.dart';
import 'package:ageal/core/cubit/app_cubit.dart';
import 'package:ageal/core/cubit/app_state.dart';
import 'package:ageal/core/cubit/image_picker_cubit/image_picker_cubit.dart';
import 'package:ageal/core/styles/app_style.dart';
import 'package:ageal/dependency_injection.dart';
import 'package:ageal/presentation/cubit/edit_profile.dart/edit_profile_cubit.dart';
import 'package:ageal/presentation/cubit/events/cubit/events_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

class AgealApp extends StatelessWidget {
  const AgealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()
            ..changeLanguage(0)
            ..getLanguage(),
        ),
        BlocProvider(create: (context) => ImagePickerCubit()),
        BlocProvider<EventsCubit>(
          create: (context) => EventsCubit(eventsRepo: getIt()),
        ),
        BlocProvider(
          create: (context) =>
              UserDataCubit(settingRepo: getIt())..getUserData(),
        ),
      ],
      child: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
        if (state is ChangeLanguageState) {
          return MaterialApp.router(
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale!.languageCode &&
                    supportedLocale.countryCode == locale.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            locale: state.locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: AppStyle.themeData(),
            debugShowCheckedModeBanner: false,
            routerConfig: router,
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
