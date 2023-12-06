import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override

  /// routes go here
  List<AutoRoute> get routes => [
        /// AllBills route
        AutoRoute(page: HomeRoute.page, initial: true, children: [
          AutoRoute(page: EditNavigationRouter.page, children: [
            AutoRoute(page: AllBillsView.page, initial: true),
            AutoRoute(page: EditeBillView.page),
          ]),

          //AddBill route
          AutoRoute(
              page: AddBillNavigationRouter.page,
              initial: true,
              children: [
                AutoRoute(page: AddBillView.page, initial: true),
                AutoRoute(page: NewBillView.page),
              ]),

          /// Profile route
          AutoRoute(page: ProfileView.page),
        ]),
      ];
}
