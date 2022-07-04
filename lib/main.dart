import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:text_editor_app/GetStarted.dart';
import 'package:text_editor_app/HomeScreen.dart';
import 'package:flutter/services.dart';
import 'globals.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  void Dispose() {
    super.dispose();
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Inter'),
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Text Editor App"),
              backgroundColor: Colors.black87,
              bottom: TabBar(
                tabs: [
                  const Tab(
                    text: "Get Started",
                  ),
                  Tab(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.extension),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Extensions")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [GetStartedPage(), Icon(Icons.access_alarm)],
            ),
          ),
        ));
  }
}
