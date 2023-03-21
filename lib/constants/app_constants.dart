import 'package:flutter/material.dart';
import 'package:sampledrawer/bloc/navigation_drawer/nav_drawer_state.dart';
import 'package:sampledrawer/widgets/navigation_item.dart';

final List<NavigationItem> navItems = [
  NavigationItem(header: true),
  NavigationItem(
    item: NavItem.alarms,
    title: 'Alarms',
    icon: Icons.alarm,
  ),
  NavigationItem(
    item: NavItem.devices,
    title: 'Devices',
    icon: Icons.devices,
  ),
  NavigationItem(
    item: NavItem.registerDevice,
    title: 'Register Device',
    icon: Icons.important_devices,
  ),
];
