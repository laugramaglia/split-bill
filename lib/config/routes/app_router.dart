import 'package:auto_route/auto_route.dart';
import 'package:split_bill/config/routes/routes_names.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override

  /// routes go here
  List<AutoRoute> get routes => [
        /// AllBills route
        AutoRoute(path: '/', page: HomeRoute.page, initial: true, children: [
          AutoRoute(page: AllBillsView.page, path: 'ds', children: [
            AutoRoute(
                page: AllBillsView.page,
                path: RoutesNav.allBills,
                initial: true),
            AutoRoute(page: EditeBillView.page, path: RoutesNav.editBill),
          ]),

          //AddBill route
          AutoRoute(
              page: EmptyAutoRouter.page,
              path: RoutesNav.main,
              initial: true,
              children: [
                AutoRoute(page: AddBillView.page, path: '', initial: true),
                AutoRoute(path: RoutesNav.addBill, page: NewBillView.page),
                AutoRoute(
                    page: EmptyAutoRouter.page,
                    path: RoutesNav.allGroups,
                    children: [
                      AutoRoute(page: AllGroupsView.page, path: ''),
                      AutoRoute(
                          page: AddGroupView.page, path: RoutesNav.addGroup),
                      AutoRoute(
                          page: EditGroupView.page,
                          path: '${RoutesNav.editGroup}/:id'),
                    ]),
              ]),

          /// Profile route
          AutoRoute(page: ProfileView.page),
        ]),
      ];
}
