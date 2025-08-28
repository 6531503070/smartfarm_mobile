import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:smartfarm_mobile/ui/hook/use_l10n.dart';
import 'package:smartfarm_mobile/util/navigation_service.dart';
import 'package:smartfarm_mobile/ui/theme/app_colors.dart';

class BottomBar extends StatefulHookWidget {
  final int currentIndex;

  const BottomBar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  void initState() {
    // _fetchBalance();
    super.initState();
  }

  void _onItemTapped(int index) {
    // Don't navigate if already on the current page
    if (index == widget.currentIndex) return;

    switch (index) {
      case 0:
        // Control
        NavigationService.navigateToControl();
        break;
      case 1:
        // Home
        NavigationService.navigateToHome();
        break;
      case 2:
        // Data
        NavigationService.navigateToData();
        break;
      // case 3:
      //   // Setting
      //   NavigationService.navigateToSetting();
      //   break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final colors = AppColors.light();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SalomonBottomBar(
          backgroundColor: colors.bottomBar,
          currentIndex: widget.currentIndex,
          onTap: _onItemTapped,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.keyboard_command_key_sharp),
              title: Text(l10n.controlPage),
              selectedColor: Colors.teal,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.home_sharp),
              title: Text(l10n.home),
              selectedColor: Colors.orange,
            ),
            // SalomonBottomBarItem(
            //   icon: const Icon(Icons.ssid_chart_sharp),
            //   title: Text(l10n.dataPage),
            //   selectedColor: Colors.pink,
            // ),
          ],
        ),
      ],
    );
  }
}
