import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/common/enum/state_widget_type.dart';
import 'package:split_bill/common/widgets/hero_card_animation_small.dart';
import 'package:split_bill/config/routes/app_router.gr.dart';
import 'package:split_bill/features/all_bills/data/models/bill_model.dart';
import 'package:split_bill/features/all_bills/data/models/items_bill_model.dart';
import 'package:split_bill/features/all_bills/data/models/user_bill_model.dart';
import 'package:split_bill/features/all_bills/presentation/providers/all_bills_provider.dart';

class BillCard extends StatelessWidget {
  final Bill item;
  const BillCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SmallCardHeroAnimation(
        heroTag: item.key.toString(),
        childSmall: ListTile(
          title: Text(item.title),
          subtitle: Text(item.totalAmountString),
        ),
        childBig: Builder(builder: (context) {
          final state = context.watch<AllBillsProvider>().state;

          return state.mapData((data) {
            final index = data.indexOf(item);
            final element = data[index];
            return Wrap(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(element.title),
                      subtitle: Text(element.totalAmountString),
                      trailing: IconButton(
                          onPressed: () =>
                              context.router.push(EditeBillView(item: element)),
                          icon: const Icon(
                            Icons.edit,
                            size: 20,
                          )),
                    ),
                    ...element.listItems.map(
                      (ItemsBill subItem) => ExpansionTile(
                        title: Text(subItem.name),
                        subtitle: Text(subItem.amountDividedPersonString),
                        shape: Border.all(
                          width: 0,
                          color: Colors.transparent,
                        ),
                        children: List.from(
                          subItem.listPersons.map(
                            (UserBill user) => ListTile(
                                title: Text('    ${user.name}'),
                                trailing: Checkbox(
                                    value: user.hasToPay,
                                    onChanged: (status) {
                                      final indexSubItem =
                                          item.listItems.indexOf(subItem);
                                      final indexUser = item
                                          .listItems[indexSubItem].listPersons
                                          .indexOf(user);
                                      Bill finalItem = item;
                                      finalItem.listItems[indexSubItem]
                                              .listPersons[indexUser] =
                                          user.copyWith(hasToPay: status);
                                      context
                                          .read<AllBillsProvider>()
                                          .updateUserStatus(
                                              finalItem, indexSubItem);
                                    })),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                              ),
                              onPressed: () => context
                                      .read<AllBillsProvider>()
                                      .deleteBill(item)
                                      .then((_) {
                                    Navigator.of(context).pop();
                                  }),
                              child: const Text(
                                'Delete',
                                style: TextStyle(color: Colors.grey),
                              )),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('Export')),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            );
          }, type: StateWidgetType.normal);
        }));
  }
}
