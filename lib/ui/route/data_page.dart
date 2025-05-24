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
                    Divider(
                      child: Text("ส่วนการเพาะปลูก").extraBold().h4(),
                    ),

                    SizedBox(height: 8),

                    // Input Query ()
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("สภาพไม้ (จำนวนต่อโซน)"),
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

                    // Input Query
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("อัตราการงอก (จำนวนต่อโซน)"),
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

                    // Input Query
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("ระบบน้ำที่ใช้ (รูปแบบ)"),
                        SizedBox(
                          width: 128,
                          child: Select(
                            itemBuilder: (context, item) {
                              return Text(item);
                            },
                            onChanged: (value) {},
                            value: selectedValue,
                            placeholder: const Text('รูปแบบ'),
                            popupConstraints: const BoxConstraints(
                              maxHeight: 300,
                              maxWidth: 200,
                            ),
                            popupWidthConstraint: PopoverConstraint.flexible,
                            children: [
                              SelectItemButton(
                                value: 'หยด',
                                child: Text('หยด'),
                              ),
                              SelectItemButton(
                                value: 'พ่นหมอก',
                                child: Text('พ่นหมอก'),
                              ),
                              SelectItemButton(
                                value: 'รดมือ',
                                child: Text('รดมือ'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 8),

                    // Input Query (tdlr)
                    //
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("หมายเหตุ"),
                        SizedBox(height: 8),
                        SizedBox(
                          width: MediaQuery.of(context).size.width *
                              0.8, // 80% of width
                          child: TextArea(
                            initialValue: '',
                            placeholder: Text(
                                "- จำนวนศัตรูพืชที่พบ (เพลี้ย, หนอน, เชื้อรา ฯลฯ)"),
                            expandableHeight: true,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    //______________________________________________________

                    //______________________________________________________
                    Divider(
                      child: Text("ส่วนการเก็บผลผลิต").extraBold().h4(),
                    ),

                    SizedBox(height: 8),

                    SizedBox(height: 8),

                    //______________________________________________________
                    Divider(
                      child: Text("สรุปผล").extraBold().h4(),
                    ),

                    SizedBox(height: 16),

                    DataTable(),

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
