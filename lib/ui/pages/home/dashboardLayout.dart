import 'package:app_system/domain/providers/init.dart';
import 'package:app_system/ui/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/side_menu.dart';

class DashboardLayout extends HookConsumerWidget {
  final Widget child;
  const DashboardLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: ref.watch(providerHome).scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              SizedBox(
                width: Responsive.wSideMenu,
                child: const SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
