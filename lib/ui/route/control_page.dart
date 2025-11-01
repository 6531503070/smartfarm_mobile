import 'package:flutter/material.dart' as material;
import 'package:lucide_icons/lucide_icons.dart' as lucide;
import 'package:bootstrap_icons/bootstrap_icons.dart' as bootstrap;
import 'package:shadcn_flutter/shadcn_flutter.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartfarm_mobile/ui/component/bottom_bar.dart';
import 'package:smartfarm_mobile/ui/component/status_card.dart';
import 'package:smartfarm_mobile/ui/component/top_bar.dart';
import 'package:smartfarm_mobile/ui/component/zone_widget.dart';
import 'package:smartfarm_mobile/ui/hook/use_l10n.dart';
import 'package:smartfarm_mobile/ui/settings.dart';
import 'package:smartfarm_mobile/data/sensor_data.dart';

class ControlPage extends HookWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final appTheme = useValueListenable(Settings.appTheme);
    
    final _from = useState(TimeOfDay(
        hour: SensorData.defaultHour, minute: SensorData.defaultMinute));
    final _to = useState(TimeOfDay(
        hour: SensorData.defaultHour, minute: SensorData.defaultMinute));
    
    // Use bool instead of CheckboxState for Switch
    final showSeconds = useState(false);
    final selectedSchedules = useState<List<String>>([]);
    final soilMoistureTriggering =
        useState<double>(SensorData.soilMoistureThreshold);
    
    // Add tab state for switching between scheduled and manual
    final selectedTab = useState(0);
    final repeatSchedule = useState(false);

    String formatTime(TimeOfDay time) {
      final hour = time.hour.toString().padLeft(2, '0');
      final minute = time.minute.toString().padLeft(2, '0');
      final second = '00';
      return showSeconds.value
          ? '$hour:$minute:$second'
          : '$hour:$minute';
    }

    void _addSchedule() {
      final fromTime = formatTime(_from.value);
      final toTime = formatTime(_to.value);
      final schedule = '$fromTime - $toTime';
      if (!selectedSchedules.value.contains(schedule)) {
        selectedSchedules.value = [...selectedSchedules.value, schedule];
      }
    }

    Widget _buildScheduledWatering() {
      return Column(
        key: const ValueKey('scheduled'),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          
          // Schedule list display
          Container(
            constraints: const BoxConstraints(minWidth: 200),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: material.Colors.grey[400]!),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${l10n.watering} ${l10n.from}-${l10n.to}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                if (selectedSchedules.value.isEmpty)
                  Text('No schedules added yet',
                      style: TextStyle(color: material.Colors.grey[600]))
                else
                  ...selectedSchedules.value.map((schedule) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: material.Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(schedule),
                            InkWell(
                              onTap: () {
                                selectedSchedules.value =
                                    selectedSchedules.value
                                        .where((s) => s != schedule)
                                        .toList();
                              },
                              child: const Icon(material.Icons.close, size: 16),
                            ),
                          ],
                        ),
                      )),
              ],
            ),
          ),
          const SizedBox(height: 16),
          
          // Time pickers
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8.0,
            children: [
              Text("${l10n.from}:"),
              TimePicker(
                showSeconds: showSeconds.value,
                use24HourFormat: true,
                value: _from.value,
                onChanged: (value) {
                  if (value != null) {
                    _from.value = value;
                  }
                },
              ),
              const SizedBox(width: 8),
              Text("${l10n.to}: "),
              TimePicker(
                showSeconds: showSeconds.value,
                use24HourFormat: true,
                value: _to.value,
                onChanged: (value) {
                  if (value != null) {
                    _to.value = value;
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Add button and show seconds toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8.0,
            children: [
              PrimaryButton(
                onPressed: _addSchedule,
                trailing: const Icon(material.Icons.add),
                child: Text("${l10n.add} "),
              ),
              Row(
                spacing: 4.0,
                children: [
                  Switch(
                    value: showSeconds.value,
                    onChanged: (value) {
                      showSeconds.value = value;
                    },
                  ),
                  Text(l10n.showSeconds),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Repeat weekly toggle
          Row(
            spacing: 4.0,
            children: [
              Switch(
                value: repeatSchedule.value,
                onChanged: (value) {
                  repeatSchedule.value = value;
                },
              ),
              Text(l10n.repeatWeekly),
            ],
          ),
          const SizedBox(height: 16),
        ],
      );
    }

    Widget _buildManualWatering() {
      return Column(
        key: const ValueKey('manual'),
        children: [
          const SizedBox(height: 32),
          Text(l10n.manualWateringDescription).muted(),
          const SizedBox(height: 24),
          ButtonGroup(
            children: [
              PrimaryButton(
                child: Text(l10n.start),
                onPressed: () {},
              ),
              DestructiveButton(
                child: Text(l10n.stop),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      );
    }

    return Scaffold(
      headers: [
        TopBar(title: l10n.controlPage),
      ],
      footers: [
        BottomBar(currentIndex: 0),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: const ZoneSelector(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Soil Moisture
                    StatusCard(
                        title: l10n.soilMoisture,
                        statusValue: SensorData.soilMoistureValue,
                        statusIcon:
                            const Icon(bootstrap.BootstrapIcons.moisture),
                        badgeType: BadgeType.secondary),
                    const SizedBox(height: 8),
                    
                    // Humidity
                    StatusCard(
                        title: l10n.humidity,
                        statusValue: SensorData.humidityValue,
                        statusIcon: const Icon(lucide.LucideIcons.cloudSunRain),
                        badgeType: BadgeType.secondary),
                    const SizedBox(height: 32),

                    // Watering Control Card
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Tab switcher using ButtonGroup
                          ButtonGroup(
                            children: [
                              selectedTab.value == 0
                                  ? PrimaryButton(
                                      child: Text(l10n.scheduled),
                                      onPressed: () {},
                                    )
                                  : OutlineButton(
                                      child: Text(l10n.scheduled),
                                      onPressed: () {
                                        selectedTab.value = 0;
                                      },
                                    ),
                              selectedTab.value == 1
                                  ? PrimaryButton(
                                      child: Text(l10n.manual),
                                      onPressed: () {},
                                    )
                                  : OutlineButton(
                                      child: Text(l10n.manual),
                                      onPressed: () {
                                        selectedTab.value = 1;
                                      },
                                    ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          
                          // Animated content switcher
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            child: selectedTab.value == 0
                                ? _buildScheduledWatering()
                                : _buildManualWatering(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}