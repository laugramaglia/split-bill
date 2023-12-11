// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:split_bill/config/routes/empty_auto_router.dart' as _i7;
import 'package:split_bill/features/add_bill/presentation/ui/views/add_bill_view.dart'
    as _i1;
import 'package:split_bill/features/add_bill/presentation/ui/views/new_bill_view.dart'
    as _i9;
import 'package:split_bill/features/all_bills/data/models/bill_model.dart'
    as _i13;
import 'package:split_bill/features/all_bills/presentation/ui/views/all_bills_view.dart'
    as _i3;
import 'package:split_bill/features/all_bills/presentation/ui/views/edite_bill_view.dart'
    as _i6;
import 'package:split_bill/features/groups/presentation/ui/views/all_groups_view.dart'
    as _i4;
import 'package:split_bill/features/groups/presentation/ui/views/edit_group_view.dart'
    as _i5;
import 'package:split_bill/features/groups/presentation/ui/views/new_group_view.dart'
    as _i2;
import 'package:split_bill/features/profile/presentation/ui/views/profile_view.dart'
    as _i10;
import 'package:split_bill/home_page.dart' as _i8;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AddBillView.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddBillView(),
      );
    },
    AddGroupView.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddGroupView(),
      );
    },
    AllBillsView.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AllBillsView(),
      );
    },
    AllGroupsView.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AllGroupsView(),
      );
    },
    EditGroupView.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EditGroupViewArgs>(
          orElse: () => EditGroupViewArgs(groupId: pathParams.getString('id')));
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.EditGroupView(
          key: args.key,
          groupId: args.groupId,
        ),
      );
    },
    EditeBillView.name: (routeData) {
      final args = routeData.argsAs<EditeBillViewArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.EditeBillView(
          item: args.item,
          key: args.key,
        ),
      );
    },
    EmptyAutoRouter.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.EmptyAutoRouter(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HomePage(),
      );
    },
    NewBillView.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.NewBillView(),
      );
    },
    ProfileView.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ProfileView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddBillView]
class AddBillView extends _i11.PageRouteInfo<void> {
  const AddBillView({List<_i11.PageRouteInfo>? children})
      : super(
          AddBillView.name,
          initialChildren: children,
        );

  static const String name = 'AddBillView';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddGroupView]
class AddGroupView extends _i11.PageRouteInfo<void> {
  const AddGroupView({List<_i11.PageRouteInfo>? children})
      : super(
          AddGroupView.name,
          initialChildren: children,
        );

  static const String name = 'AddGroupView';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AllBillsView]
class AllBillsView extends _i11.PageRouteInfo<void> {
  const AllBillsView({List<_i11.PageRouteInfo>? children})
      : super(
          AllBillsView.name,
          initialChildren: children,
        );

  static const String name = 'AllBillsView';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AllGroupsView]
class AllGroupsView extends _i11.PageRouteInfo<void> {
  const AllGroupsView({List<_i11.PageRouteInfo>? children})
      : super(
          AllGroupsView.name,
          initialChildren: children,
        );

  static const String name = 'AllGroupsView';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.EditGroupView]
class EditGroupView extends _i11.PageRouteInfo<EditGroupViewArgs> {
  EditGroupView({
    _i12.Key? key,
    required String groupId,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          EditGroupView.name,
          args: EditGroupViewArgs(
            key: key,
            groupId: groupId,
          ),
          rawPathParams: {'id': groupId},
          initialChildren: children,
        );

  static const String name = 'EditGroupView';

  static const _i11.PageInfo<EditGroupViewArgs> page =
      _i11.PageInfo<EditGroupViewArgs>(name);
}

class EditGroupViewArgs {
  const EditGroupViewArgs({
    this.key,
    required this.groupId,
  });

  final _i12.Key? key;

  final String groupId;

  @override
  String toString() {
    return 'EditGroupViewArgs{key: $key, groupId: $groupId}';
  }
}

/// generated route for
/// [_i6.EditeBillView]
class EditeBillView extends _i11.PageRouteInfo<EditeBillViewArgs> {
  EditeBillView({
    required _i13.Bill item,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          EditeBillView.name,
          args: EditeBillViewArgs(
            item: item,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditeBillView';

  static const _i11.PageInfo<EditeBillViewArgs> page =
      _i11.PageInfo<EditeBillViewArgs>(name);
}

class EditeBillViewArgs {
  const EditeBillViewArgs({
    required this.item,
    this.key,
  });

  final _i13.Bill item;

  final _i12.Key? key;

  @override
  String toString() {
    return 'EditeBillViewArgs{item: $item, key: $key}';
  }
}

/// generated route for
/// [_i7.EmptyAutoRouter]
class EmptyAutoRouter extends _i11.PageRouteInfo<void> {
  const EmptyAutoRouter({List<_i11.PageRouteInfo>? children})
      : super(
          EmptyAutoRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptyAutoRouter';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.NewBillView]
class NewBillView extends _i11.PageRouteInfo<void> {
  const NewBillView({List<_i11.PageRouteInfo>? children})
      : super(
          NewBillView.name,
          initialChildren: children,
        );

  static const String name = 'NewBillView';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ProfileView]
class ProfileView extends _i11.PageRouteInfo<void> {
  const ProfileView({List<_i11.PageRouteInfo>? children})
      : super(
          ProfileView.name,
          initialChildren: children,
        );

  static const String name = 'ProfileView';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
