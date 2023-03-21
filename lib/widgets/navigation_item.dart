import 'package:flutter/material.dart';
import 'package:sampledrawer/bloc/navigation_drawer/blocs.dart';

class NavigationItem {
  final bool header;
  final NavItem? item;
  final String? title;
  final IconData? icon;

  NavigationItem({
    this.header = false,
    this.item,
    this.title,
    this.icon,
  });
}
