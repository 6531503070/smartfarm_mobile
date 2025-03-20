import 'package:flutter_hooks/flutter_hooks.dart';
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
  const DataPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final appTheme = useValueListenable(Settings.appTheme);
    final appFont = useValueListenable(Settings.appFont);
    final StepperController harvestController = StepperController();
    final StepperController pestDiseaseController = StepperController();

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
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Pest & Disease', style: appFont).extraBold().h4(),
                    Stepper(
                      controller: pestDiseaseController,
                      direction: Axis.vertical,
                      steps: [
                        Step(
                          title: const Text('Disease Detection'),
                          icon: StepNumber(
                            onPressed: () {
                              pestDiseaseController.jumpToStep(0);
                            },
                          ),
                          contentBuilder: (context) {
                            return StepContainer(
                              actions: [
                                const SecondaryButton(
                                  child: Text('Prev'),
                                ),
                                PrimaryButton(
                                    child: const Text('Next'),
                                    onPressed: () {
                                      pestDiseaseController.nextStep();
                                    }),
                              ],
                              child: SizedBox(),
                            );
                          },
                        ),
                        Step(
                          title: const Text('Pest Detection'),
                          icon: StepNumber(
                            onPressed: () {
                              pestDiseaseController.jumpToStep(1);
                            },
                          ),
                          contentBuilder: (context) {
                            return StepContainer(
                              actions: [
                                SecondaryButton(
                                  child: const Text('Prev'),
                                  onPressed: () {
                                    pestDiseaseController.previousStep();
                                  },
                                ),
                                PrimaryButton(
                                    child: const Text('Next'),
                                    onPressed: () {
                                      pestDiseaseController.nextStep();
                                    }),
                              ],
                              child: SizedBox(),
                            );
                          },
                        ),
                        Step(
                          title: const Text('How it affects (Description)'),
                          icon: StepNumber(
                            onPressed: () {
                              pestDiseaseController.jumpToStep(2);
                            },
                          ),
                          contentBuilder: (context) {
                            return StepContainer(
                              actions: [
                                SecondaryButton(
                                  child: const Text('Prev'),
                                  onPressed: () {
                                    pestDiseaseController.previousStep();
                                  },
                                ),
                                PrimaryButton(
                                    child: const Text('Finish'),
                                    onPressed: () {
                                      pestDiseaseController.nextStep();
                                    }),
                              ],
                              child: SizedBox(),
                            );
                          },
                        ),
                      ],
                    ),
                    
                    Divider(),
                    const SizedBox(height: 8),
                    
                    Text('Harvest', style: appFont).extraBold().h4(),
                    Stepper(
                      controller: harvestController,
                      direction: Axis.vertical,
                      steps: [
                        Step(
                          title: const Text('Size'),
                          icon: StepNumber(
                            onPressed: () {
                              harvestController.jumpToStep(0);
                            },
                          ),
                          contentBuilder: (context) {
                            return StepContainer(
                              actions: [
                                const SecondaryButton(
                                  child: Text('Prev'),
                                ),
                                PrimaryButton(
                                    child: const Text('Next'),
                                    onPressed: () {
                                      harvestController.nextStep();
                                    }),
                              ],
                              child: SizedBox(),
                            );
                          },
                        ),
                        Step(
                          title: const Text('Quality'),
                          icon: StepNumber(
                            onPressed: () {
                              harvestController.jumpToStep(1);
                            },
                          ),
                          contentBuilder: (context) {
                            return StepContainer(
                              actions: [
                                SecondaryButton(
                                  child: const Text('Prev'),
                                  onPressed: () {
                                    harvestController.previousStep();
                                  },
                                ),
                                PrimaryButton(
                                    child: const Text('Next'),
                                    onPressed: () {
                                      harvestController.nextStep();
                                    }),
                              ],
                              child: SizedBox(),
                            );
                          },
                        ),
                        Step(
                          title: const Text('Produce Amount (Per Tree)'),
                          icon: StepNumber(
                            onPressed: () {
                              harvestController.jumpToStep(2);
                            },
                          ),
                          contentBuilder: (context) {
                            return StepContainer(
                              actions: [
                                SecondaryButton(
                                  child: const Text('Prev'),
                                  onPressed: () {
                                    harvestController.previousStep();
                                  },
                                ),
                                PrimaryButton(
                                    child: const Text('Finish'),
                                    onPressed: () {
                                      harvestController.nextStep();
                                    }),
                              ],
                              child: SizedBox(),
                            );
                          },
                        ),
                      ],
                    ),

                    Divider(),
                    const SizedBox(height: 16),

                    DataTable(),

                    const SizedBox(height: 16),

                    PrimaryButton(
                      size: ButtonSize(1.15),
                      onPressed: () {},
                      child: Text('Export to local (Excel file .xlsx)', style: appFont).semiBold(),
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