import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampledrawer/bloc/navigation_drawer/blocs.dart';
import 'package:sampledrawer/constants/app_constants.dart';
import 'package:sampledrawer/widgets/navigation_item.dart';
import 'package:sizer/sizer.dart';

class NavDrawerWidget extends StatelessWidget {
  final String email;
  final String description;

  const NavDrawerWidget({
    super.key,
    required this.email,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    final ThemeData theme = Theme.of(context);

    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: navItems.length,
              itemBuilder: (context, index) {
                return BlocBuilder<NavDrawerBloc, NavDrawerState>(
                  builder: (context, state) {
                    final NavigationItem navItem = navItems[index];
                    final NavItem selectedItem = state.selectedItem;
                    final bool isSelected = selectedItem == navItem.item;

                    if (navItems[index].header) {
                      return Container(
                        height: 25.h,
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        margin: EdgeInsets.only(bottom: 3.h),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 4.h,
                              backgroundColor: theme.primaryColor,
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              email,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 1.h),
                            Text(description),
                          ],
                        ),
                      );
                    } else {
                      return ListTile(
                        selected: isSelected,
                        textColor: Colors.black,
                        iconColor: Colors.black,
                        leading: Icon(
                          navItem.icon,
                        ),
                        title: Text(
                          navItem.title!,
                          style: TextStyle(
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        onTap: () {
                          if (selectedItem != navItem.item) {
                            BlocProvider.of<NavDrawerBloc>(context).add(
                              NavigateTo(navItem.item!),
                            );
                            Navigator.pop(context);
                          } else {
                            Navigator.pop(context);
                            messenger.clearSnackBars();
                            messenger.showSnackBar(
                              SnackBar(
                                content: Text(
                                  'You are already on ${navItems[index].title}',
                                ),
                              ),
                            );
                          }
                        },
                      );
                    }
                  },
                );
              },
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                messenger.clearSnackBars();
                messenger.showSnackBar(
                  const SnackBar(
                    content: Text('Logged out successfuly'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
