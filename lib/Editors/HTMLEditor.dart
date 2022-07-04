import 'dart:developer';
import 'package:flutter/foundation.dart';
import '../globals.dart';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class HTMLEditor2 extends StatefulWidget {
  const HTMLEditor2({Key? key}) : super(key: key);

  @override
  State<HTMLEditor2> createState() => HTMLEditor2State();
}

class HTMLEditor2State extends State<HTMLEditor2> {
  late TextStyle whitecolor = TextStyle(color: Colors.white);
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Row(
            children: [
              Text(
                "Live",
                style: whitecolor,
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.html,
                size: 55,
              ),
              SizedBox(
                width: 8,
              ),
              Text('Server')
            ],
          ),
          centerTitle: false,
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  _webViewController.reload();
                  print('message is: ' + Globals().text);
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
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  late TextEditingController _textEditingController;

  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    String editorText = '';
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: SingleChildScrollView(
          child: TextField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            controller: _textEditingController,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: "Write your code here.."),
            onChanged: (String text) {
              setState(() {
                Globals().text = text;
              });
            },
          ),
        ));
  }
}

late InAppWebViewController _webViewController;

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
        child: InAppWebView(
          initialUrlRequest:
              URLRequest(url: Uri.dataFromString(Globals().text)),
          onWebViewCreated: (InAppWebViewController controller) {
            _webViewController = controller;
          },
        ));
  }
}
