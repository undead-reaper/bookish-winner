import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampledrawer/bloc/navigation_drawer/blocs.dart';
import 'package:sampledrawer/constants/app_constants.dart';
import 'package:sampledrawer/widgets/nav_drawer_widget.dart';
import 'package:sampledrawer/widgets/navigation_item.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: theme.scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: BlocProvider<NavDrawerBloc>(
        create: (BuildContext context) => NavDrawerBloc(),
        child: BlocBuilder<NavDrawerBloc, NavDrawerState>(
          builder: (BuildContext context, NavDrawerState state) {
            final NavigationItem selectedItem = navItems.firstWhere(
              (NavigationItem item) => item.item == state.selectedItem,
            );

            return Scaffold(
              drawer: const NavDrawerWidget(
                email: 'dharamsoni1010@gmail.com',
                description: 'Operator',
              ),
              appBar: AppBar(
                elevation: 0,
                backgroundColor: theme.scaffoldBackgroundColor,
                foregroundColor: Colors.black,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: theme.scaffoldBackgroundColor,
                  statusBarIconBrightness: Brightness.dark,
                ),
                title: Text(selectedItem.title!),
              ),
              body: Center(
                child: Text(
                  selectedItem.title!,
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
