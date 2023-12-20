import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/common/enum/state_widget_type.dart';
import 'package:split_bill/common/widgets/hero_card_animation_small.dart';
import 'package:split_bill/config/routes/routes_names.dart';
import 'package:split_bill/features/all_bills/data/models/bill_model.dart';
import 'package:split_bill/features/all_bills/data/models/items_bill_model.dart';
import 'package:split_bill/features/all_bills/presentation/providers/all_bills_provider.dart';
import 'package:split_bill/features/all_bills/presentation/ui/widgets/bill_item_persons_expansion_tile.dart';

class BillCard extends StatelessWidget {
  final Bill item;
  const BillCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SmallCardHeroAnimation(
        heroTag: item.key.toString(),
        childSmall: SizedBox(
          height: 50,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(item.title, style: Theme.of(context).textTheme.titleLarge),
            const Spacer(),
            Text(
              item.totalAmountString,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(width: 10),
            IconButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  context.router.navigateNamed(RoutesNav.allBills.navTo +
                      RoutesNav.export.navToWithParam(item.key.toString()));
                },
                icon: const Icon(Icons.send)),
          ]),
        ),
        childBig: Builder(builder: (context) {
          final state = context.watch<AllBillsProvider>().state;

          return state.mapData((data) {
            final index = data.indexOf(item);
            final element = data[index];
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text(element.title),
                    subtitle: Text(element.totalAmountString),
                  ),
                  ...element.listItems.map(
                    (ItemsBill subItem) => ExpansionTile(
                        title: Text(subItem.name),
                        subtitle: Text(subItem.amountDividedPersonString),
                        shape: Border.all(
                          width: 0,
                          color: Colors.transparent,
                        ),
                        children: [
                          BillItemPersonsExpansionTile(
                              users: subItem.listPersons,
                              onTap: (value, key, user) {
                                if (user == null) {
                                  return;
                                }
                                final indexSubItem =
                                    item.listItems.indexOf(subItem);
                                final indexUser = item
                                    .listItems[indexSubItem].listPersons
                                    .indexOf(user);
                                Bill finalItem = item;
                                finalItem.listItems[indexSubItem]
                                        .listPersons[indexUser] =
                                    user.copyWith(hasToPay: value);
                                context
                                    .read<AllBillsProvider>()
                                    .updateUserStatus(finalItem, indexSubItem);
                              })
                        ]),
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
            );
          }, type: StateWidgetType.normal);
        }));
  }
}
