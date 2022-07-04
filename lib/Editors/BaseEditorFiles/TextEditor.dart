import 'package:flutter/material.dart';
import 'package:text_editor_app/globals.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/javascript.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/androidstudio.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

late String markDownText = '';

class TextEditor extends StatefulWidget {
  const TextEditor({Key? key}) : super(key: key);

  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  late TextEditingController _textEditingController;
  late CodeController _codeController;

  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    final source = '';
    _codeController = CodeController(
        text: source, language: javascript, theme: androidstudioTheme);
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
          child: CodeField(
            controller: _codeController,
            textStyle: TextStyle(fontFamily: 'JetBrains Mono'),
          ),
        )));
  }
}
