import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/androidstudio.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:text_editor_app/globals.dart';
import 'Page1.dart';
import 'Page2.dart';

class MarkdownEditor2 extends StatefulWidget {
  const MarkdownEditor2({Key? key}) : super(key: key);

  @override
  State<MarkdownEditor2> createState() => MarkdownEditor2State();
}

late String newtext = '';

class MarkdownEditor2State extends State<MarkdownEditor2> {
  late TextStyle whitecolor = TextStyle(color: Colors.white);
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(backgroundColor: Color(0xff282b2e)),
        home: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Row(
                children: [Text('Markdown Editor')],
              ),
              centerTitle: false,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              actions: [
                IconButton(
                    onPressed: () {
                      print(Globals().markdownEditorText);
                      print(Color(
                          androidstudioTheme["root"]!.backgroundColor!.value));
                    },
                    icon: Icon(Icons.save))
              ]),
          body: IndexedStack(
            index: selectedindex,
            children: [Page1(), Page2()],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.edit),
                label: "Edit",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.preview_outlined), label: "Preview")
            ],
            currentIndex: selectedindex,
            onTap: (int index) {
              setState(() {
                selectedindex = index;
              });
            },
          ),
        ));
  }
}
