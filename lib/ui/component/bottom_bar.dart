import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:smartfarm_mobile/ui/route/control_page.dart';
import 'package:smartfarm_mobile/ui/route/data_page.dart';
import 'package:smartfarm_mobile/ui/route/home_page.dart';

class BottomBar extends StatefulWidget {
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
    switch (index) {
      case 0:
        // Control
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: ControlPage(), 
          ),
        );
        break;
      case 1:
        // Home
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: HomePage(),
          ),
        );
        break;
      case 2:
        // Data
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: DataPage(),
          ),
        );
        break;
      // case 3:
      //   // Setting
      //   Navigator.push(
      //     context,
      //     PageTransition(
      //       type: PageTransitionType.fade,
      //       child: WalletPage(),
      //     ),
      //   );
      //   break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [        
        SalomonBottomBar(
          currentIndex: widget.currentIndex,
          onTap: _onItemTapped,
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.keyboard_command_key_sharp),
              title: Text("Control"),
              selectedColor: Colors.teal,
            ),
             SalomonBottomBarItem(
              icon: Icon(Icons.home_sharp),
              title: Text("Home"),
              selectedColor: Colors.orange,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.ssid_chart_sharp),
              title: Text("Data"),
              selectedColor: Colors.pink,
            ),
          ],
        ),
      ],
    );
  }
}
