import 'package:flutter/material.dart';
import 'package:split_bill/common/enum/state_widget_type.dart';
import 'package:split_bill/services/app_exeption.dart';

class ErrorView extends StatelessWidget {
  final StateWidgetType type;
  final AppException error;
  const ErrorView({super.key, required this.type, required this.error});

  @override
  Widget build(BuildContext context) => switch (type) {
        StateWidgetType.sliver => SliverFillRemaining(
            child: _errWidget,
          ),
        StateWidgetType.normal => Center(
            child: _errWidget,
          ),
      };
  Widget get _errWidget => Center(
        child: Text(error.message),
      );
}
