import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:text_editor_app/GetStarted.dart';
import 'package:text_editor_app/HomeScreen.dart';
import 'package:flutter/services.dart';
import 'package:text_editor_app/main.dart';
import '../globals.dart';

InAppLocalhostServer localhostServer = new InAppLocalhostServer();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await localhostServer.start();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  void Dispose() {
    localhostServer.close();
    super.dispose();
  }

  late TabController _tabController;
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: GetStartedPage());
  }
}
