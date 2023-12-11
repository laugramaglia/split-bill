import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/config/routes/routes_names.dart';
import 'package:split_bill/features/groups/presentation/providers/group_provider.dart';
import 'package:split_bill/features/groups/presentation/ui/widgets/group_card.dart';

@RoutePage()
class AllGroupsView extends StatelessWidget {
  const AllGroupsView({super.key});

  void navNewGroup(BuildContext context) =>
      context.router.navigateNamed(RoutesNav.main.navTo +
          RoutesNav.allGroups.navTo +
          RoutesNav.addGroup.navTo);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          // Sliver App Bar
          SliverAppBar(
            title: const Text('All Groups'),
            floating: true,
            snap: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.router.pop(),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => navNewGroup(context),
              )
            ],
          ),
          // Sliver List
          Builder(builder: (context) {
            final state = context.watch<GroupProvider>().state;

            return state.map(
              loading: () => const SliverToBoxAdapter(
                  child: Center(
                child: CupertinoActivityIndicator(),
              )),
              error: (err) => SliverToBoxAdapter(
                  child: Center(
                child: Text(err.message),
              )),
              data: (data) => data.isEmpty
                  ? SliverToBoxAdapter(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                            child: Text('No groups found'),
                          ),
                          ElevatedButton(
                            onPressed: () => navNewGroup(context),
                            child: const Text('Add Group'),
                          )
                        ],
                      ),
                    )
                  : SliverList.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) =>
                          GroupCard(data: data[index])),
            );
          }),
        ],
      ),
    );
  }
}
