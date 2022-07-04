import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class LeftToolBarTest extends StatefulWidget {
  const LeftToolBarTest({Key? key}) : super(key: key);

  @override
  State<LeftToolBarTest> createState() => _LeftToolBarTestState();
}

class _LeftToolBarTestState extends State<LeftToolBarTest>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Demo")),
        body: Row(
          children: <Widget>[
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) =>
                  setState(() => _selectedIndex = index),
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(FontAwesome5.folder_open),
                    label: Text('File Explorer')),
                NavigationRailDestination(
                    icon: Icon(FontAwesome5.search),
                    label: Text('Search and Replace')),
                NavigationRailDestination(
                    icon: Icon(FontAwesome5.puzzle_piece),
                    label: Text('Extensions')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
