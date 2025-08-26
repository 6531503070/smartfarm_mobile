import 'dart:io';

import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
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
import 'package:smartfarm_mobile/util/excel_export_service.dart';

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

    // State management for form inputs
    final strengthValue = useState<double>(0);
    final germinationValue = useState<double>(0);
    final wateringMethod = useState<String?>(null);
    final isFertilized = useState<bool>(false);
    final pestFound = useState<bool>(false);
    final plantingNotes = useState<String>('');
    final totalHarvested = useState<double>(0);
    final totalWeight = useState<double>(0);
    final damagedDefective = useState<double>(0);
    final harvestNotes = useState<String>('');
    final isExporting = useState<bool>(false);

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
                            initialValue: strengthValue.value,
                            onChanged: (value) => strengthValue.value = value,
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
                            initialValue: germinationValue.value,
                            onChanged: (value) =>
                                germinationValue.value = value,
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
                            onChanged: (value) => wateringMethod.value = value,
                            value: wateringMethod.value,
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
                          state: isFertilized.value
                              ? CheckboxState.checked
                              : CheckboxState.unchecked,
                          onChanged: (value) => isFertilized.value =
                              value == CheckboxState.checked,
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
                          state: pestFound.value
                              ? CheckboxState.checked
                              : CheckboxState.unchecked,
                          onChanged: (value) =>
                              pestFound.value = value == CheckboxState.checked,
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
                            initialValue: plantingNotes.value,
                            onChanged: (value) => plantingNotes.value = value,
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
                            initialValue: totalHarvested.value,
                            onChanged: (value) => totalHarvested.value = value,
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
                            initialValue: totalWeight.value,
                            onChanged: (value) => totalWeight.value = value,
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
                            initialValue: damagedDefective.value,
                            onChanged: (value) =>
                                damagedDefective.value = value,
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
                            initialValue: harvestNotes.value,
                            onChanged: (value) => harvestNotes.value = value,
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
                          strengthValue.value.toString(),
                          germinationValue.value.toString(),
                          wateringMethod.value ?? l10n.none,
                          isFertilized.value ? l10n.yes : l10n.no,
                          pestFound.value ? l10n.yes : l10n.no,
                          plantingNotes.value.isNotEmpty
                              ? plantingNotes.value
                              : l10n.dash
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
                          totalHarvested.value.toString(),
                          totalWeight.value.toString(),
                          damagedDefective.value.toString(),
                          harvestNotes.value.isNotEmpty
                              ? harvestNotes.value
                              : l10n.dash
                        ],
                      ],
                    ),

                    SizedBox(height: 16),

                    // Export to Excel
                    PrimaryButton(
                      size: ButtonSize(1.15),
                      onPressed: () async {
                        isExporting.value = true;
                        try {
                          // Prepare data for export
                          final plantingData = [
                            [
                              '${l10n.zone} 1',
                              strengthValue.value.toString(),
                              germinationValue.value.toString(),
                              wateringMethod.value ?? l10n.none,
                              isFertilized.value ? l10n.yes : l10n.no,
                              pestFound.value ? l10n.yes : l10n.no,
                              plantingNotes.value.isNotEmpty
                                  ? plantingNotes.value
                                  : l10n.dash
                            ],
                          ];

                          final harvestData = [
                            [
                              '${l10n.zone} 1',
                              totalHarvested.value.toString(),
                              totalWeight.value.toString(),
                              damagedDefective.value.toString(),
                              harvestNotes.value.isNotEmpty
                                  ? harvestNotes.value
                                  : l10n.dash
                            ],
                          ];

                          final userInputs = {
                            'Inspection Date':
                                "${DateTime.now().day.toString().padLeft(2, '0')}/${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().year} - ${_value.hour.toString().padLeft(2, '0')}:${_value.minute.toString().padLeft(2, '0')}",
                            'Zone': '${l10n.zone} 1',
                          };

                          final filePath =
                              await ExcelExportService.exportToExcel(
                            l10n: l10n,
                            plantingData: plantingData,
                            harvestData: harvestData,
                            userInputs: userInputs,
                            inspectionDate:
                                "${DateTime.now().day.toString().padLeft(2, '0')}/${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().year} - ${_value.hour.toString().padLeft(2, '0')}:${_value.minute.toString().padLeft(2, '0')}",
                            context: context,
                          );

                          if (filePath != null) {
                            // Show success message using a simple dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Success'),
                                  content: Text(
                                      'Excel file exported to Downloads folder: ${filePath.split('/').last}'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            // Show error message using a simple dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text(
                                      'Failed to export Excel file. Please check storage permissions.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        } catch (e) {
                          // Show error message using a simple dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text('Error exporting file: $e'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        } finally {
                          isExporting.value = false;
                        }
                      },
                      child: isExporting.value
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: material.CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: material.AlwaysStoppedAnimation<
                                        material.Color>(material.Colors.white),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text('Exporting...'),
                              ],
                            )
                          : Text(l10n.exportToLocal),
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
