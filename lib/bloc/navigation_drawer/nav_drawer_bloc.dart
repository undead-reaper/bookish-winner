import 'package:bloc/bloc.dart';
import 'package:sampledrawer/bloc/navigation_drawer/nav_drawer_event.dart';
import 'package:sampledrawer/bloc/navigation_drawer/nav_drawer_state.dart';

class NavDrawerBloc extends Bloc<NavDrawerEvent, NavDrawerState> {
  NavDrawerBloc({NavDrawerState? state})
      : super(const NavDrawerState(NavItem.alarms)) {
    on<NavDrawerEvent>(_handleNavigationEvent);
  }

  _handleNavigationEvent(NavDrawerEvent navDrawerEvent,
      Emitter<NavDrawerState> navBarStateEmitter) {
    if (navDrawerEvent is NavigateTo) {
      if (navDrawerEvent.destination != state.selectedItem) {
        navBarStateEmitter(NavDrawerState(navDrawerEvent.destination));
      }
    }
  }
}
