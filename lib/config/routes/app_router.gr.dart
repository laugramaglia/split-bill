// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i11;
import 'package:split_bill/features/add_bill/presentation/router/add_bill_navigation_router.dart'
    as _i1;
import 'package:split_bill/features/add_bill/presentation/ui/views/add_bill_view.dart'
    as _i2;
import 'package:split_bill/features/add_bill/presentation/ui/views/new_bill_view.dart'
    as _i7;
import 'package:split_bill/features/all_bills/data/models/bill_model.dart'
    as _i10;
import 'package:split_bill/features/all_bills/presentation/ui/router/edit_bill_navigation_router.dart'
    as _i4;
import 'package:split_bill/features/all_bills/presentation/ui/views/all_bills_view.dart'
    as _i3;
import 'package:split_bill/features/all_bills/presentation/ui/views/edite_bill_view.dart'
    as _i5;
import 'package:split_bill/features/profile/presentation/ui/views/profile_view.dart'
    as _i8;
import 'package:split_bill/home_page.dart' as _i6;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AddBillNavigationRouter.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddBillNavigationRouter(),
      );
    },
    AddBillView.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddBillView(),
      );
    },
    AllBillsView.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AllBillsView(),
      );
    },
    EditNavigationRouter.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.EditNavigationRouter(),
      );
    },
    EditeBillView.name: (routeData) {
      final args = routeData.argsAs<EditeBillViewArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.EditeBillView(
          item: args.item,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
      );
    },
    NewBillView.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.NewBillView(),
      );
    },
    ProfileView.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ProfileView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddBillNavigationRouter]
class AddBillNavigationRouter extends _i9.PageRouteInfo<void> {
  const AddBillNavigationRouter({List<_i9.PageRouteInfo>? children})
      : super(
          AddBillNavigationRouter.name,
          initialChildren: children,
        );

  static const String name = 'AddBillNavigationRouter';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddBillView]
class AddBillView extends _i9.PageRouteInfo<void> {
  const AddBillView({List<_i9.PageRouteInfo>? children})
      : super(
          AddBillView.name,
          initialChildren: children,
        );

  static const String name = 'AddBillView';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AllBillsView]
class AllBillsView extends _i9.PageRouteInfo<void> {
  const AllBillsView({List<_i9.PageRouteInfo>? children})
      : super(
          AllBillsView.name,
          initialChildren: children,
        );

  static const String name = 'AllBillsView';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EditNavigationRouter]
class EditNavigationRouter extends _i9.PageRouteInfo<void> {
  const EditNavigationRouter({List<_i9.PageRouteInfo>? children})
      : super(
          EditNavigationRouter.name,
          initialChildren: children,
        );

  static const String name = 'EditNavigationRouter';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.EditeBillView]
class EditeBillView extends _i9.PageRouteInfo<EditeBillViewArgs> {
  EditeBillView({
    required _i10.Bill item,
    _i11.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          EditeBillView.name,
          args: EditeBillViewArgs(
            item: item,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditeBillView';

  static const _i9.PageInfo<EditeBillViewArgs> page =
      _i9.PageInfo<EditeBillViewArgs>(name);
}

class EditeBillViewArgs {
  const EditeBillViewArgs({
    required this.item,
    this.key,
  });

  final _i10.Bill item;

  final _i11.Key? key;

  @override
  String toString() {
    return 'EditeBillViewArgs{item: $item, key: $key}';
  }
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.NewBillView]
class NewBillView extends _i9.PageRouteInfo<void> {
  const NewBillView({List<_i9.PageRouteInfo>? children})
      : super(
          NewBillView.name,
          initialChildren: children,
        );

  static const String name = 'NewBillView';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ProfileView]
class ProfileView extends _i9.PageRouteInfo<void> {
  const ProfileView({List<_i9.PageRouteInfo>? children})
      : super(
          ProfileView.name,
          initialChildren: children,
        );

  static const String name = 'ProfileView';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
