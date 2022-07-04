import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:text_editor_app/globals.dart';
import 'Page1.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        child: MarkdownBody(data: Globals().markdownEditorText));
  }
}
