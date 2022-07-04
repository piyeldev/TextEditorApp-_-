import 'package:flutter/material.dart';
import 'MenuItem.dart' as MenuItemReq;

class MenuItems {
  static const List<MenuItemReq.MenuItemReq> itemsFirst = [
    saveItem,
    saveAsItem,
  ];

  static const List<MenuItemReq.MenuItemReq> itemsThird = [aboutItem];
  static const List<MenuItemReq.MenuItemReq> itemsSecond = [welcomeScreenItem];
  static const saveItem =
      MenuItemReq.MenuItemReq(text: 'Save', icon: Icons.save_rounded);

  static const saveAsItem =
      MenuItemReq.MenuItemReq(text: 'Save as', icon: Icons.save_as_rounded);

  static const aboutItem =
      MenuItemReq.MenuItemReq(text: 'About', icon: Icons.info);

  static const welcomeScreenItem = MenuItemReq.MenuItemReq(
      text: 'Go to Welcome Page', icon: Icons.logout_rounded);
}
