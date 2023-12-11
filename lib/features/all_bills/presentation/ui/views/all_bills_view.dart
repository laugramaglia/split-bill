import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:split_bill/common/enum/state_widget_type.dart';
import 'package:split_bill/config/routes/app_router.gr.dart';
import 'package:split_bill/features/all_bills/presentation/providers/all_bills_provider.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/features/all_bills/presentation/ui/widgets/bill_card.dart';

@RoutePage()
class AllBillsView extends StatelessWidget {
  const AllBillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Sliver App Bar
        const SliverAppBar(
          title: Text('All Bills'),
          floating: true,
          snap: true,
        ),
        Builder(builder: (context) {
          final state = context.watch<AllBillsProvider>().state;
          return state.mapData(
              (items) => SliverList.builder(
                    itemBuilder: (BuildContext context, int index) => Card(
                      clipBehavior: Clip.antiAlias,
                      child: BillCard(item: items[index]),
                    ),
                    itemCount: items.length,
                  ),
              type: StateWidgetType.sliver);
        }),
      ],
    );
  }
}
