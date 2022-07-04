import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/androidstudio.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:highlight/languages/python.dart';
import 'package:text_editor_app/Editors/BaseEditorFiles/TextEditor.dart';
import 'package:text_editor_app/globals.dart';

class CodeEditor extends StatefulWidget {
  const CodeEditor({Key? key}) : super(key: key);

  @override
  State<CodeEditor> createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  late TextEditingController _textEditingController;
  late CodeController _codeController;

  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    final source = '';
    _codeController = CodeController(
        text: source, language: python, theme: androidstudioTheme);
  }

  void dispose() {
    super.dispose();
    _codeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    late String markdownText = _codeController.text;
    Globals().markdownEditorText = markdownText;

    int _selectedIndex = 0;
    return Scaffold(
      backgroundColor: androidstudioTheme["root"]!.backgroundColor,
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: Container(
              color: androidstudioTheme["root"]!.backgroundColor,
              child: SafeArea(
                child: Column(
                  children: [
                    Text(
                      "index.html",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text("style.css", style: TextStyle(fontSize: 20)),
                    Text("app.js", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              TextEditor(),
              TextEditor(),
              TextEditor(),
            ],
          ),
        ),
      ),
    );
  }
}
