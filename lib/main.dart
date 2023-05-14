import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/configs/basic_config.dart';
import 'package:flutter_app/providers/user_state.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await setupHive();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserState()),
    ],
    builder: (context, child) {
      context.read<UserState>().initData();
      return const MyApp();
    },
  ));
}

//TODO innit Hive storage
Future setupHive() async {
  Directory documents = await getApplicationDocumentsDirectory();
  Hive.init(documents.path);
  await Hive.openBox(boxUserSettingName);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    offFlashScreen();
  }

   void offFlashScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
