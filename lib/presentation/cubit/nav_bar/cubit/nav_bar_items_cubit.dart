import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../view/event/event_page.dart';
import '../../../view/home/home_page.dart';
import '../../../view/search/search_screen.dart';
import '../../../view/setting/setting_screen.dart';

class NavBarItemsCubit extends Cubit<int> {
  NavBarItemsCubit() : super(0);
  void setPage(int newIndex) => emit(newIndex);

  final List<Widget> pages = [
    const HomePage(),
    const EventsPage(navigationSource: 'news'),
    const SearchScreen(),
    const EventsPage(navigationSource: 'platfrom'),
    const SettingScreen()
  ];
}
