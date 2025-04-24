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
                    Text(l10n.yieldAndDisease).extraBold().h4(),
                    Stepper(
                      controller: pestDiseaseController,
                      direction: Axis.vertical,
                      steps: [
                        Step(
                          title: Text(l10n.diseaseDetection),
                          icon: StepNumber(
                            onPressed: () {
                              pestDiseaseController.jumpToStep(0);
                            },
                          ),
                          contentBuilder: (context) {
                            return StepContainer(
                              actions: [
                                SecondaryButton(
                                  child: Text(l10n.prev),
                                ),
                                PrimaryButton(
                                    child: Text(l10n.next),
                                    onPressed: () {
                                      pestDiseaseController.nextStep();
                                    }),
                              ],
                              child: SizedBox(),
                            );
                          },
                        ),
                        Step(
                          title: Text(l10n.yieldAndDisease),
                          icon: StepNumber(
                            onPressed: () {
                              pestDiseaseController.jumpToStep(1);
                            },
                          ),
                          contentBuilder: (context) {
                            return StepContainer(
                              actions: [
                                SecondaryButton(
                                  child: Text(l10n.prev),
                                  onPressed: () {
                                    pestDiseaseController.previousStep();
                                  },
                                ),
                                PrimaryButton(
                                    child: Text(l10n.next),
                                    onPressed: () {
                                      pestDiseaseController.nextStep();
                                    }),
                              ],
                              child: SizedBox(),
                            );
                          },
                        ),
                        Step(
                          title: Text(l10n.howItAffects),
                          icon: StepNumber(
                            onPressed: () {
                              pestDiseaseController.jumpToStep(2);
                            },
                          ),
                          contentBuilder: (context) {
                            return StepContainer(
                              actions: [
                                SecondaryButton(
                                  child: Text(l10n.prev),
                                  onPressed: () {
                                    pestDiseaseController.previousStep();
                                  },
                                ),
                                PrimaryButton(
                                    child: Text(l10n.finish),
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
                    SizedBox(height: 8),
                    Text(l10n.harvest).extraBold().h4(),
                    Stepper(
                      controller: harvestController,
                      direction: Axis.vertical,
                      steps: [
                        Step(
                          title: Text(l10n.size),
                          icon: StepNumber(
                            onPressed: () {
                              harvestController.jumpToStep(0);
                            },
                          ),
                          contentBuilder: (context) {
                            return StepContainer(
                              actions: [
                                SecondaryButton(
                                  child: Text(l10n.prev),
                                ),
                                PrimaryButton(
                                    child: Text(l10n.next),
                                    onPressed: () {
                                      harvestController.nextStep();
                                    }),
                              ],
                              child: SizedBox(),
                            );
                          },
                        ),
                        Step(
                          title: Text(l10n.waterUsage),
                          icon: StepNumber(
                            onPressed: () {
                              harvestController.jumpToStep(1);
                            },
                          ),
                          contentBuilder: (context) {
                            return StepContainer(
                              actions: [
                                SecondaryButton(
                                  child: Text(l10n.prev),
                                  onPressed: () {
                                    harvestController.previousStep();
                                  },
                                ),
                                PrimaryButton(
                                    child: Text(l10n.next),
                                    onPressed: () {
                                      harvestController.nextStep();
                                    }),
                              ],
                              child: SizedBox(),
                            );
                          },
                        ),
                        Step(
                          title: Text(l10n.produceAmount),
                          icon: StepNumber(
                            onPressed: () {
                              harvestController.jumpToStep(2);
                            },
                          ),
                          contentBuilder: (context) {
                            return StepContainer(
                              actions: [
                                SecondaryButton(
                                  child: Text(l10n.prev),
                                  onPressed: () {
                                    harvestController.previousStep();
                                  },
                                ),
                                PrimaryButton(
                                    child: Text(l10n.finish),
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
                    SizedBox(height: 16),
                    DataTable(),
                    SizedBox(height: 16),
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
