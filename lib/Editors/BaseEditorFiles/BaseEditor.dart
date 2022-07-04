import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:text_editor_app/Editors/BaseEditorFiles/TabController.dart';
import 'package:text_editor_app/Editors/Menus/About.dart';
import 'package:text_editor_app/Editors/Menus/MenuItem.dart';
import 'package:flutter_highlight/themes/androidstudio.dart';
import 'package:path_provider/path_provider.dart';

import 'package:text_editor_app/Editors/Menus/MenuItem.dart';
import 'package:text_editor_app/Editors/Menus/MenuItems.dart';
import 'package:text_editor_app/Editors/main2.dart';
import 'package:text_editor_app/GetStarted.dart';
import 'package:text_editor_app/main.dart';

class BaseEditor extends StatefulWidget {
  const BaseEditor({Key? key}) : super(key: key);

  @override
  State<BaseEditor> createState() => _BaseEditorState();
}

bool isRunnable = true;

var scaffoldKey = GlobalKey<ScaffoldState>();

class _BaseEditorState extends State<BaseEditor> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    String selectedMenu = '';
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: -1,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  width: 70,
                  child: Container(
                    color: Colors.black87,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        IconButton(
                            color: Colors.white,
                            onPressed: () {},
                            icon: Icon(
                              FontAwesome5.folder,
                              size: 25,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesome5.search,
                              size: 25,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesome5.code_branch,
                              size: 25,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.extension_rounded,
                              size: 25,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(child: CodeEditor()),
            ],
          ),
          key: scaffoldKey,
          drawer: FileManager(),
          appBar: AppBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: const Icon(Icons.menu_open),
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
            title: Column(children: [
              const Text(
                "Untitled01",
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                "C:/Files/",
                style: TextStyle(fontSize: 15),
              )
            ]),
            actions: [
              Container(
                  child: isRunnable
                      ? ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              shadowColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent)),
                          onPressed: () {},
                          icon: const Icon(Icons.play_arrow_rounded),
                          label: const Text('Run'),
                        )
                      : Container()),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.terminal_rounded)),
              PopupMenuButton<MenuItemReq>(
                onSelected: (item) => OnSelected(context, item),
                itemBuilder: ((context) => [
                      ...MenuItems.itemsFirst.map(buildItem).toList(),
                      const PopupMenuDivider(),
                      ...MenuItems.itemsSecond.map(buildItem).toList(),
                      ...MenuItems.itemsThird.map(buildItem).toList(),
                    ]),
              ),
            ],
          )),
    );
  }

  PopupMenuItem<MenuItemReq> buildItem(MenuItemReq item) =>
      PopupMenuItem<MenuItemReq>(
        value: item,
        child: Row(children: [
          Icon(
            item.icon,
            color: Colors.black87,
            size: 30,
          ),
          const SizedBox(width: 10),
          Text(
            item.text,
            style: const TextStyle(fontSize: 15),
          )
        ]),
      );

  void OnSelected(BuildContext context, MenuItemReq item) {
    switch (item) {
      case MenuItems.aboutItem:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const AboutPage()));
        break;

      case MenuItems.welcomeScreenItem:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MainScreen()));
        break;

      case MenuItems.saveItem:
        getApplicationDocumentsDirectory();
        print(getApplicationDocumentsDirectory());
        break;
    }
  }
}

class FileManager extends StatefulWidget {
  const FileManager({Key? key}) : super(key: key);

  @override
  State<FileManager> createState() => _FileManagerState();
}

class _FileManagerState extends State<FileManager> {
  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: androidstudioTheme["root"]!.backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[],
          ),
        ),
      );
}
