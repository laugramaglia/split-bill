import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:split_bill/config/routes/app_router.gr.dart';

@RoutePage()
class AddBillView extends StatelessWidget {
  const AddBillView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          double dimension =
              constraints.maxWidth < 400 ? constraints.maxWidth : 400;
          // check height
          final heightConstrains = constraints.maxHeight / 2;
          if (heightConstrains < dimension) {
            dimension = heightConstrains;
          }
          dimension -= 32;

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CardButton(
                dimension: dimension,
                icon: Icons.add,
                title: 'Add Bill',
                onTap: () => context.router.push(const NewBillView()),
              ),
              CardButton(
                  dimension: dimension,
                  icon: Icons.group,
                  iconSize: 60,
                  title: 'Create group',
                  onTap: () {}),
            ],
          );
        }),
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  final double? dimension;
  final String? title;
  final IconData icon;
  final double iconSize;
  final Function()? onTap;
  const CardButton(
      {this.title,
      this.dimension,
      required this.icon,
      this.iconSize = 80,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox.square(
        dimension: dimension,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  size: iconSize,
                ),
                if (title case final title?)
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(title,
                        style: Theme.of(context).textTheme.headlineMedium),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
