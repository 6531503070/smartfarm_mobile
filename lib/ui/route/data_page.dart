import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smartfarm_mobile/gen_l10n/l10n.dart';
import 'package:smartfarm_mobile/ui/component/bottom_bar.dart';
import 'package:smartfarm_mobile/ui/component/data_table.dart';
import 'package:smartfarm_mobile/ui/component/top_bar.dart';
import 'package:smartfarm_mobile/ui/component/zone_widget.dart';
import 'package:smartfarm_mobile/ui/hook/use_l10n.dart';
import 'package:smartfarm_mobile/ui/settings.dart';
import 'package:smartfarm_mobile/ui/theme/app_colors.dart';

import 'package:flutter/material.dart' as material;
import 'package:shadcn_flutter/shadcn_flutter.dart';

class DataPage extends HookWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final appTheme = useValueListenable(Settings.appTheme);
    final StepperController harvestController = StepperController();
    final StepperController pestDiseaseController = StepperController();

    double value = 0;
    String? selectedValue;
    TimeOfDay _value = TimeOfDay.now();

    return Scaffold(
      headers: [
        TopBar(title: l10n.dataPage),
      ],
      footers: [
        BottomBar(currentIndex: 2),
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
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //______________________________________________________

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.inspectionDate,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${DateTime.now().day.toString().padLeft(2, '0')}/${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().year} - ${_value.hour.toString().padLeft(2, '0')}:${_value.minute.toString().padLeft(2, '0')}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    //______________________________________________________
                    Divider(
                      child: Text(l10n.plantingSection).extraBold().h4(),
                    ),

                    SizedBox(height: 8),

                    // Input Query (ความแข็งแรง)
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l10n.strengthPerZone),
                        SizedBox(
                          width: 128,
                          child: NumberInput(
                            showButtons: true,
                            initialValue: value,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    // Input Query (อัตราการงอก)
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l10n.germinationRatePerZone),
                        SizedBox(
                          width: 128,
                          child: NumberInput(
                            showButtons: true,
                            initialValue: value,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    // Input Query (ให้น้ำ)
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l10n.wateringMethod),
                        SizedBox(
                          width: 128,
                          child: Select(
                            itemBuilder: (context, item) {
                              return Text(item);
                            },
                            onChanged: (value) {},
                            value: selectedValue,
                            placeholder: Text(l10n.none),
                            popupConstraints: const BoxConstraints(
                              maxHeight: 300,
                              maxWidth: 200,
                            ),
                            popupWidthConstraint: PopoverConstraint.flexible,
                            children: [
                              SelectItemButton(
                                value: l10n.none,
                                child: Text(l10n.none),
                              ),
                              SelectItemButton(
                                value: l10n.drip,
                                child: Text(l10n.drip),
                              ),
                              SelectItemButton(
                                value: l10n.spray,
                                child: Text(l10n.spray),
                              ),
                              SelectItemButton(
                                value: l10n.handWatering,
                                child: Text(l10n.handWatering),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 8),

                    // Input Query (ให้ปุ๋ย)
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l10n.fertilized),
                        Checkbox(
                          state: CheckboxState.checked,
                          onChanged: (value) {},
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    // Input Query (พบศัตรูพืช)
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l10n.pestFound),
                        Checkbox(
                          state: CheckboxState.checked,
                          onChanged: (value) {},
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    // Input Query (หมายเหตุ)
                    //
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(l10n.note),
                        SizedBox(height: 8),
                        SizedBox(
                          width: MediaQuery.of(context).size.width *
                              0.8, // 80% of width
                          child: TextArea(
                            initialValue: '',
                            // placeholder: Text(
                            //     "- ศัตรูพืชที่พบและปริมาณ (เพลี้ย, หนอน, เชื้อรา ฯลฯ)\n"
                            //     "- วิธีการจัดการศัตรูพืช (สารเคมี/ชีวภาพ, ชื่อสาร, อัตราใช้)\n"
                            //     "\n"
                            //     "หมายเหตุอื่นๆ"),
                            placeholder: Text(l10n.otherNotes),
                            expandableHeight: true,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    //______________________________________________________

                    //______________________________________________________
                    Divider(
                      child: Text(l10n.harvestSection).extraBold().h4(),
                    ),

                    SizedBox(height: 8),

                    // Input Query (จำนวนผลที่เก็บได้ทั้งหมด)
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l10n.totalHarvested),
                        SizedBox(
                          width: 128,
                          child: NumberInput(
                            showButtons: true,
                            initialValue: value,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    // Input Query (น้ำหนักรวม)
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l10n.totalWeight),
                        SizedBox(
                          width: 128,
                          child: NumberInput(
                            showButtons: true,
                            initialValue: value,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    // Input Query (จำนวนผลเสีย/ชำรุด)
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l10n.damagedDefective),
                        SizedBox(
                          width: 128,
                          child: NumberInput(
                            showButtons: true,
                            initialValue: value,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    // Input Query (หมายเหตุ)
                    //
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(l10n.note),
                        SizedBox(height: 8),
                        SizedBox(
                          width: MediaQuery.of(context).size.width *
                              0.8, // 80% of width
                          child: TextArea(
                            initialValue: '',
                            placeholder: Text(l10n.otherNotes),
                            expandableHeight: true,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    //______________________________________________________
                    Divider(
                      child: Text(l10n.summary).extraBold().h4(),
                    ),

                    SizedBox(height: 16),

                    // Planting Data Table
                    DataTable(
                      headers: [
                        l10n.zone,
                        l10n.strength,
                        l10n.germinationRate,
                        l10n.wateringMethodHeader,
                        l10n.fertilizedHeader,
                        l10n.pestFoundHeader,
                        l10n.plantingNotesHeader,
                      ],
                      rows: [
                        [
                          '${l10n.zone} 1',
                          '90',
                          '85',
                          l10n.drip,
                          l10n.yes,
                          l10n.yes,
                          l10n.aphidsLow
                        ],
                        [
                          '${l10n.zone} 2',
                          '80',
                          '75',
                          l10n.spray,
                          l10n.no,
                          l10n.no,
                          l10n.dash
                        ],
                      ],
                    ),

                    SizedBox(height: 16),

                    // Harvest Data Table
                    DataTable(
                      headers: [
                        l10n.zone,
                        l10n.totalHarvestedHeader,
                        l10n.totalWeightHeader,
                        l10n.damagedDefectiveHeader,
                        l10n.harvestNotesHeader,
                      ],
                      rows: [
                        [
                          '${l10n.zone} 1',
                          '120',
                          '35.5',
                          '2.0',
                          l10n.goodQuality
                        ],
                        [
                          '${l10n.zone} 2',
                          '100',
                          '28.0',
                          '1.5',
                          l10n.someSmallFruits
                        ],
                      ],
                    ),

                    SizedBox(height: 16),

                    // Conclusion and export to excel
                    PrimaryButton(
                      size: ButtonSize(1.15),
                      onPressed: () {},
                      child: Text(l10n.exportToLocal).semiBold(),
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
