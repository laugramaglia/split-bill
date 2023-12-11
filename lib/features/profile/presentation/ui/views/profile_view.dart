import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:split_bill/config/theme/theme_hive_box.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            ValueListenableBuilder<Box<bool>>(
                valueListenable: ThemeBox.instance.listenable(),
                builder: (context, value, child) {
                  return SwitchListTile(
                    title: const Text('Theme mode'),
                    value: value.get(ThemeBox.instance.key) ?? false,
                    onChanged: (value) {
                      ThemeBox.instance.put(value);
                    },
                  );
                }),
          ],
        )),
      ),
    );
  }
}
