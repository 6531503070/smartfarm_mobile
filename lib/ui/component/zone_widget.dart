import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartfarm_mobile/ui/settings.dart';

class ZoneSelector extends HookWidget {
  const ZoneSelector({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final currentListOfZones = useValueListenable(Settings.listOfZones);
    final cureentSelectedZoneIndex = useValueListenable(Settings.selectedZoneIndex);

    return CustomDropdown<String>.search(
      hintText: 'Select zone',
      items: currentListOfZones,
      initialItem: currentListOfZones[cureentSelectedZoneIndex],
      onChanged: (value) {
        print('changing value to: $value');
      },
    );
  }
}