import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:flutter_highlight/themes/androidstudio.dart';
import 'package:text_editor_app/Editors/TestLeftToolBar.dart';
import 'Editors/BaseEditorFiles/BaseEditor.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

TextStyle whiteText = TextStyle(color: Colors.white);
IconThemeData whiteButtonColor = IconThemeData(color: Colors.white);
TextButtonThemeData buttonWhitetext = TextButtonThemeData(
    style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white)));

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: whiteButtonColor,
        textButtonTheme: buttonWhitetext,
        fontFamily: 'Inter',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: androidstudioTheme["root"]!.backgroundColor,
        body: Container(
          margin: const EdgeInsets.only(left: 30, top: 30),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Start",
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BaseEditor()));
                    },
                    child: Center(
                      child: Row(
                        children: [
                          const Icon(Icons.drive_file_rename_outline_outlined),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("New file")
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LeftToolBarTest())));
                    },
                    child: Center(
                      child: Row(
                        children: [
                          const Icon(Icons.file_open_outlined),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("Open a file")
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Center(
                      child: Row(
                        children: [
                          const Icon(Icons.folder_open_outlined),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("Open folder")
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Center(
                      child: Row(
                        children: [
                          const Icon(FontAwesome5.code_branch),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("Clone a Git Repository")
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Recent",
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
