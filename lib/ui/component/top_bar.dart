import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartfarm_mobile/gen/assets.gen.dart';
import 'package:smartfarm_mobile/ui/settings.dart';
import 'package:smartfarm_mobile/ui/theme/app_colors.dart';

import 'package:shadcn_flutter/shadcn_flutter.dart' as shadcn;

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  TopBar({
    required this.title,
    this.actions = const [],
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.light();

    return AppBar(
      backgroundColor: colors.topBar,
      elevation: 4,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      leadingWidth: 160,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6),
            child: Image(
              image: Assets.images.logo.provider(),
              width: 120,
              height: kToolbarHeight / 1.75,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: IconButton(
            icon: Icon(Icons.language_sharp),
            onPressed: () {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(1, kToolbarHeight, 0, 0),
                items: [
                  PopupMenuItem(
                    value: Locale('en', 'EN'),
                    child: Text('English'),
                  ),
                  PopupMenuItem(
                    value: Locale('th', 'TH'),
                    child: Text('ไทย'),
                  ),
                  PopupMenuItem(
                    value: Locale('my', 'MY'),
                    child: Text('မြန်မာ'),
                  ),
                  // Add more languages here
                ],
                elevation: 8.0,
              ).then((selectedLocale) {
                if (selectedLocale != null) {
                  Settings.appLocalization.value = selectedLocale;
                }
              });
            }, // language btn
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(right: 8),
        //   child: IconButton(
        //     icon: Icon(Icons.notifications_sharp),
        //     onPressed: () {}, // notification btn
        //   ),
        // ),
      ],
    );

    // return shadcn.OutlinedContainer(
    //   clipBehavior: Clip.antiAliasWithSaveLayer,
    //   child: shadcn.AppBar(
    //     header: const Text('This is Header'),
    //     title: const Text('This is Title'),
    //     subtitle: const Text('This is Subtitle'),
    //     leading: [
    //       shadcn.OutlineButton(
    //         density: shadcn.ButtonDensity.icon,
    //         onPressed: () {},
    //         child: const Icon(Icons.arrow_back),
    //       ),
    //     ],
    //     trailing: [
    //       shadcn.OutlineButton(
    //         density: shadcn.ButtonDensity.icon,
    //         onPressed: () {},
    //         child: const Icon(Icons.search),
    //       ),
    //       shadcn.OutlineButton(
    //         density: shadcn.ButtonDensity.icon,
    //         onPressed: () {},
    //         child: const Icon(Icons.more_vert),
    //       ),
    //     ],
    //   ),
    // );
  }
}
