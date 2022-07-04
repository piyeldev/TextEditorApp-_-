import 'package:flutter/material.dart';
import 'package:text_editor_app/globals.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/markdown.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/androidstudio.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

late String markDownText = '';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  late TextEditingController _textEditingController;
  late CodeController _codeController;

  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    final source = '';
    _codeController = CodeController(
        text: source, language: markdown, theme: androidstudioTheme);
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

    return Scaffold(
        backgroundColor: androidstudioTheme["root"]!.backgroundColor,
        body: Container(
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: scrollController,
          child: CodeField(
            controller: _codeController,
            textStyle: TextStyle(fontFamily: 'JetBrains Mono'),
          ),
        )));
  }
}
