import 'package:flutter/material.dart';
import 'package:text_editor_app/Editors/HTMLEditor.dart';
import 'package:text_editor_app/Editors/MarkdownEditor/MarkdownEditor.dart';

class HomescreenNew extends StatefulWidget {
  const HomescreenNew({Key? key}) : super(key: key);

  @override
  State<HomescreenNew> createState() => _HomescreenNewState();
}

class _HomescreenNewState extends State<HomescreenNew> {
  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    textStyle: TextStyle(color: Colors.white),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text("EdiThor"),
              // centerTitle: true,
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            body: Body()));
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 100,
            width: 200,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const MarkdownEditor2())));
              },
              label: const Text(
                "Markdown Editor",
                style: TextStyle(fontSize: 20),
              ),
              icon: const Icon(
                Icons.arrow_circle_down,
                size: 50,
              ),
            )),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 100,
          width: 200,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HTMLEditor2()));
            },
            label: const Text(
              "Live HTML Server",
              style: TextStyle(fontSize: 20),
            ),
            icon: const Icon(
              Icons.html,
              size: 50,
            ),
          ),
        ),
      ],
    ));
  }
}
