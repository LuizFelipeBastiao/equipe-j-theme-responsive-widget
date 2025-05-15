import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:theme_responsive_widget/app.dart';
import 'package:theme_responsive_widget/models/user_model.dart';
import 'package:theme_responsive_widget/data/init/app_init_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('users');
  AppInitData.initialize();

  runApp(MyApp());
}
