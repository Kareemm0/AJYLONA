import 'package:ageal/ageal_app.dart';
import 'package:ageal/core/shared/shared_prefrence.dart';
import 'package:ageal/dependency_injection.dart';
import 'package:flutter/material.dart';

void main(context) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();
  AppSharedPrefrences().init();

  runApp(const AgealApp());
}
