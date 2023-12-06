import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:split_bill/config/routes/app_router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<_MenuItem> listItems = const [
    _MenuItem(
      pageRouteInfo: AllBillsView(),
      navigationDestination: NavigationDestination(
        icon: Icon(Icons.view_list),
        label: 'All bills',
      ),
    ),
    _MenuItem(
      pageRouteInfo: AddBillView(),
      navigationDestination: NavigationDestination(
        icon: Icon(Icons.add_circle),
        label: 'Add bill',
      ),
    ),
    _MenuItem(
      pageRouteInfo: ProfileView(),
      navigationDestination: NavigationDestination(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: listItems.map((e) => e.pageRouteInfo).toList(),
      bottomNavigationBuilder: (_, tabRouter) => NavigationBar(
        selectedIndex: tabRouter.activeIndex,
        onDestinationSelected: (int index) {
          tabRouter.setActiveIndex(index);
        },
        destinations: listItems
            .map((e) => e.navigationDestination)
            .toList(growable: false),
      ),
    );
  }
}

class _MenuItem {
  final PageRouteInfo pageRouteInfo;
  final NavigationDestination navigationDestination;

  const _MenuItem({
    required this.pageRouteInfo,
    required this.navigationDestination,
  });
}
