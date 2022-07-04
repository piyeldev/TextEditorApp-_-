import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class LiveHTMLServer extends StatefulWidget {
  const LiveHTMLServer({Key? key}) : super(key: key);

  @override
  State<LiveHTMLServer> createState() => _LiveHTMLServerState();
}

class _LiveHTMLServerState extends State<LiveHTMLServer>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _textEditingController;
  late String text = "";

  late InAppWebViewController _webViewController;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _textEditingController = TextEditingController();
  }

  _loadHTMLfromAssets() async {
    String fileText = await rootBundle.loadString('assets/test.html');
    _webViewController.loadFile(assetFilePath: 'assets/test.html');
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle whiteStyle = TextStyle(color: Colors.white);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldkey,
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
                style: whiteStyle,
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
                },
                icon: Icon(Icons.save))
          ],
          bottom: TabBar(
            onTap: (index) {},
            controller: _tabController,
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Edit",
                      style: whiteStyle,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.edit)
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Preview",
                      style: whiteStyle,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.preview_outlined)
                  ],
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                controller: _textEditingController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Write your code here.."),
                onChanged: (String text) {
                  setState(() {
                    text = this.text = text;
                  });
                },
              ),
            ),
            Container(
              child: Stack(
                children: [
                  InAppWebView(
                    initialUrlRequest:
                        URLRequest(url: Uri.dataFromString(text)),
                    onWebViewCreated: (InAppWebViewController controller) {
                      _webViewController = controller;
                      // _loadHTMLfromAssets();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
