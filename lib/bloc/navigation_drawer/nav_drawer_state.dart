class NavDrawerState {
  final NavItem selectedItem;

  const NavDrawerState(this.selectedItem);
}

enum NavItem { alarms, devices, registerDevice }
