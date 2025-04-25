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

class ControlPage extends HookWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final appTheme = useValueListenable(Settings.appTheme);
    final _from = useState(TimeOfDay.now());
    final _to = useState(TimeOfDay.now());
    final checkboxState = useState(CheckboxState.unchecked);
    final selectedSchedules = useState<List<String>>([]);
    final soilMoistureTriggering = useState<double>(0);

    String formatTime(TimeOfDay time) {
      final hour = time.hour.toString().padLeft(2, '0');
      final minute = time.minute.toString().padLeft(2, '0');
      final second = '00';
      return checkboxState.value == CheckboxState.checked
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

    return Scaffold(
      headers: [
        TopBar(title: l10n.controlPage),
      ],
      footers: [
        BottomBar(currentIndex: 0),
      ],
      backgroundColor: appTheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: ZoneSelector(),
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
                        statusValue: "50%",
                        statusIcon:
                            const Icon(bootstrap.BootstrapIcons.moisture),
                        badgeType: BadgeType.secondary),
                    SizedBox(height: 8),
                    // Humidity
                    StatusCard(
                        title: l10n.humidity,
                        statusValue: "70%",
                        statusIcon: const Icon(lucide.LucideIcons.cloudSunRain),
                        badgeType: BadgeType.secondary),
                    SizedBox(height: 8),
                    // Temperature
                    StatusCard(
                        title: l10n.temperature,
                        statusValue: "42°C",
                        statusIcon: const Icon(
                            bootstrap.BootstrapIcons.thermometer_sun),
                        badgeType: BadgeType.secondary),
                    SizedBox(height: 32),

                    // Watering Control
                    Card(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(l10n.watering).h3(),
                          ),
                          SizedBox(height: 24),
                          StatusCard(
                            title: l10n.raining,
                            statusValue: l10n.notRaining,
                            statusIcon:
                                Icon(bootstrap.BootstrapIcons.cloud_rain),
                            badgeType: BadgeType.destructive,
                          ),
                          SizedBox(height: 24),
                          MultiSelect<String>(
                            children: [
                              SelectGroup(
                                headers: [
                                  SelectLabel(
                                    child: Text(l10n.watering),
                                  ),
                                ],
                                children: [
                                  for (final schedule
                                      in selectedSchedules.value)
                                    SelectItemButton(
                                      value: schedule,
                                      child: Text(schedule),
                                    ),
                                ],
                              ),
                            ],
                            itemBuilder: (context, schedule) {
                              return Text(schedule);
                            },
                            value: selectedSchedules.value,
                            onChanged: (values) {
                              selectedSchedules.value = values.toList();
                            },
                            placeholder: Text(
                                '${l10n.watering} ${l10n.from}-${l10n.to}'),
                            constraints: const BoxConstraints(
                              minWidth: 200,
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 4.0,
                            children: [
                              // from
                              Text("${l10n.from}:"),
                              TimePicker(
                                showSeconds: checkboxState.value ==
                                    CheckboxState.checked,
                                use24HourFormat: true,
                                value: _from.value,
                                onChanged: (value) {
                                  if (value != null) {
                                    _from.value = value;
                                  }
                                },
                              ),
                              SizedBox(height: 8),

                              // to
                              Text("${l10n.to}: "),
                              TimePicker(
                                showSeconds: checkboxState.value ==
                                    CheckboxState.checked,
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
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 4.0,
                            children: [
                              PrimaryButton(
                                onPressed: _addSchedule,
                                trailing: const Icon(Icons.add),
                                child: Text("${l10n.add} "),
                              ),
                              Checkbox(
                                state: checkboxState.value,
                                onChanged: (value) {
                                  checkboxState.value = value;
                                },
                                trailing: Text(l10n.showSeconds),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          // TextField(
                          //   initialValue: soilMoistureTriggering.toString(),
                          //   // onChanged: (value) {
                          //   //   setState(() {
                          //   //     this.value = double.tryParse(value) ?? 0;
                          //   //   });
                          //   // },
                          //   // features: const [
                          //   //   InputFeature.spinner(),
                          //   // ],
                          //   // submitFormatters: [
                          //   //   TextInputFormatters.mathExpression(),
                          //   // ],
                          // ),
                          SizedBox(height: 16),
                          Divider(thickness: 2),
                          SizedBox(height: 16),
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
