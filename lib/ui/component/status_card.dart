import 'package:flutter/material.dart' as material;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:smartfarm_mobile/ui/settings.dart';

enum BadgeType {
  primary,
  secondary,
  destructive,
  outline,
}

class StatusCard extends HookWidget {
  final String title;
  final String statusValue;
  final String latestUpdate;
  final Icon? statusIcon;
  final BadgeType badgeType;

  const StatusCard({
    Key? key,
    // Default value
    this.title = 'Title',
    this.statusValue = '0',
    this.latestUpdate = '2021-01-01',
    this.statusIcon = const Icon(Icons.info, color: Colors.black),
    this.badgeType = BadgeType.primary,
  }) : super(key: key);

  Widget _buildBadge() {
    final badgeText = Text(statusValue).h4();
    switch (badgeType) {
      case BadgeType.primary:
        return PrimaryBadge(
          child: badgeText,
          onPressed: () {},
        );
      case BadgeType.secondary:
        return SecondaryBadge(
          child: badgeText,
          onPressed: () {},
        );
      case BadgeType.destructive:
        return DestructiveBadge(
          child: badgeText,
          onPressed: () {},
        );
      case BadgeType.outline:
        return OutlineBadge(
          child: badgeText,
          onPressed: () {},
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (statusIcon != null) ...[
                statusIcon!,
                const SizedBox(width: 12),
              ],
              Text(title).bold(),
              Spacer(),
              _buildBadge(),
            ],
          ),
          // Row(
          //   children: [
          //     Text('Latest update ', style: appFont).muted().small().p(),
          //     Spacer(),
          //     Text(latestUpdate, style: appFont).muted().small().p(),
          //   ],
          // ),
        ],
      ),
    );
  }
}
