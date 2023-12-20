// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/cupertino.dart' as _i15;
import 'package:flutter/material.dart' as _i13;
import 'package:split_bill/config/routes/empty_auto_router.dart' as _i1;
import 'package:split_bill/features/add_bill/presentation/ui/views/add_bill_view.dart'
    as _i2;
import 'package:split_bill/features/add_bill/presentation/ui/views/new_bill_view.dart'
    as _i10;
import 'package:split_bill/features/all_bills/data/models/bill_model.dart'
    as _i14;
import 'package:split_bill/features/all_bills/presentation/ui/views/all_bills_view.dart'
    as _i4;
import 'package:split_bill/features/all_bills/presentation/ui/views/edite_bill_view.dart'
    as _i7;
import 'package:split_bill/features/groups/presentation/ui/views/all_groups_view.dart'
    as _i5;
import 'package:split_bill/features/groups/presentation/ui/views/edit_group_view.dart'
    as _i6;
import 'package:split_bill/features/groups/presentation/ui/views/new_group_view.dart'
    as _i3;
import 'package:split_bill/features/outcome/presentation/ui/views/export_view.dart'
    as _i8;
import 'package:split_bill/features/profile/presentation/ui/views/profile_view.dart'
    as _i11;
import 'package:split_bill/home_page.dart' as _i9;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AddBillEmtyPage.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddBillRouterEmptyPage(),
      );
    },
    AddBillView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddBillView(),
      );
    },
    AddGroupView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AddGroupView(),
      );
    },
    AllGroupsEmptyPage.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AllBillsRouterEmptyPage(),
      );
    },
    AllBillsView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AllBillsView(),
      );
    },
    AllGroupsView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AllGroupsView(),
      );
    },
    EditGroupView.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EditGroupViewArgs>(
          orElse: () => EditGroupViewArgs(groupId: pathParams.getString('id')));
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.EditGroupView(
          key: args.key,
          groupId: args.groupId,
        ),
      );
    },
    EditeBillView.name: (routeData) {
      final args = routeData.argsAs<EditeBillViewArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.EditeBillView(
          item: args.item,
          key: args.key,
        ),
      );
    },
    ExportView.name: (routeData) {
      final args = routeData.argsAs<ExportViewArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.ExportView(
          key: args.key,
          bill: args.bill,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.HomePage(),
      );
    },
    NewBillView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.NewBillView(),
      );
    },
    ProfileView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ProfileView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddBillRouterEmptyPage]
class AddBillEmtyPage extends _i12.PageRouteInfo<void> {
  const AddBillEmtyPage({List<_i12.PageRouteInfo>? children})
      : super(
          AddBillEmtyPage.name,
          initialChildren: children,
        );

  static const String name = 'AddBillEmtyPage';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddBillView]
class AddBillView extends _i12.PageRouteInfo<void> {
  const AddBillView({List<_i12.PageRouteInfo>? children})
      : super(
          AddBillView.name,
          initialChildren: children,
        );

  static const String name = 'AddBillView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AddGroupView]
class AddGroupView extends _i12.PageRouteInfo<void> {
  const AddGroupView({List<_i12.PageRouteInfo>? children})
      : super(
          AddGroupView.name,
          initialChildren: children,
        );

  static const String name = 'AddGroupView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i1.AllBillsRouterEmptyPage]
class AllGroupsEmptyPage extends _i12.PageRouteInfo<void> {
  const AllGroupsEmptyPage({List<_i12.PageRouteInfo>? children})
      : super(
          AllGroupsEmptyPage.name,
          initialChildren: children,
        );

  static const String name = 'AllGroupsEmptyPage';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AllBillsView]
class AllBillsView extends _i12.PageRouteInfo<void> {
  const AllBillsView({List<_i12.PageRouteInfo>? children})
      : super(
          AllBillsView.name,
          initialChildren: children,
        );

  static const String name = 'AllBillsView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AllGroupsView]
class AllGroupsView extends _i12.PageRouteInfo<void> {
  const AllGroupsView({List<_i12.PageRouteInfo>? children})
      : super(
          AllGroupsView.name,
          initialChildren: children,
        );

  static const String name = 'AllGroupsView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.EditGroupView]
class EditGroupView extends _i12.PageRouteInfo<EditGroupViewArgs> {
  EditGroupView({
    _i13.Key? key,
    required String groupId,
    List<_i12.PageRouteInfo>? children,
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

  static const _i12.PageInfo<EditGroupViewArgs> page =
      _i12.PageInfo<EditGroupViewArgs>(name);
}

class EditGroupViewArgs {
  const EditGroupViewArgs({
    this.key,
    required this.groupId,
  });

  final _i13.Key? key;

  final String groupId;

  @override
  String toString() {
    return 'EditGroupViewArgs{key: $key, groupId: $groupId}';
  }
}

/// generated route for
/// [_i7.EditeBillView]
class EditeBillView extends _i12.PageRouteInfo<EditeBillViewArgs> {
  EditeBillView({
    required _i14.Bill item,
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          EditeBillView.name,
          args: EditeBillViewArgs(
            item: item,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditeBillView';

  static const _i12.PageInfo<EditeBillViewArgs> page =
      _i12.PageInfo<EditeBillViewArgs>(name);
}

class EditeBillViewArgs {
  const EditeBillViewArgs({
    required this.item,
    this.key,
  });

  final _i14.Bill item;

  final _i13.Key? key;

  @override
  String toString() {
    return 'EditeBillViewArgs{item: $item, key: $key}';
  }
}

/// generated route for
/// [_i8.ExportView]
class ExportView extends _i12.PageRouteInfo<ExportViewArgs> {
  ExportView({
    _i15.Key? key,
    required _i14.Bill bill,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ExportView.name,
          args: ExportViewArgs(
            key: key,
            bill: bill,
          ),
          initialChildren: children,
        );

  static const String name = 'ExportView';

  static const _i12.PageInfo<ExportViewArgs> page =
      _i12.PageInfo<ExportViewArgs>(name);
}

class ExportViewArgs {
  const ExportViewArgs({
    this.key,
    required this.bill,
  });

  final _i15.Key? key;

  final _i14.Bill bill;

  @override
  String toString() {
    return 'ExportViewArgs{key: $key, bill: $bill}';
  }
}

/// generated route for
/// [_i9.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.NewBillView]
class NewBillView extends _i12.PageRouteInfo<void> {
  const NewBillView({List<_i12.PageRouteInfo>? children})
      : super(
          NewBillView.name,
          initialChildren: children,
        );

  static const String name = 'NewBillView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ProfileView]
class ProfileView extends _i12.PageRouteInfo<void> {
  const ProfileView({List<_i12.PageRouteInfo>? children})
      : super(
          ProfileView.name,
          initialChildren: children,
        );

  static const String name = 'ProfileView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
