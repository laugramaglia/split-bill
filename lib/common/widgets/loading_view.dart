import 'package:flutter/cupertino.dart';
import 'package:split_bill/common/enum/state_widget_type.dart';

class LoadingView extends StatelessWidget {
  final StateWidgetType type;
  const LoadingView({super.key, required this.type});

  @override
  Widget build(BuildContext context) => switch (type) {
        StateWidgetType.sliver => SliverFillRemaining(
            child: _loadingWidget,
          ),
        StateWidgetType.normal => _loadingWidget
      };
  Widget get _loadingWidget =>
      const Center(child: CupertinoActivityIndicator());
}
