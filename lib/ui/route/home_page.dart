import 'package:flutter/material.dart' as material;
import 'package:shadcn_flutter/shadcn_flutter.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartfarm_mobile/ui/component/bottom_bar.dart';
import 'package:smartfarm_mobile/ui/component/system_performance_metric.dart';
import 'package:smartfarm_mobile/ui/component/temp_metric.dart';
import 'package:smartfarm_mobile/ui/component/top_bar.dart';
import 'package:smartfarm_mobile/ui/component/zone_widget.dart';
import 'package:smartfarm_mobile/ui/hook/use_l10n.dart';
import 'package:smartfarm_mobile/ui/theme/app_colors.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final colors = AppColors.light();
  
    return Scaffold(
      headers: [
        TopBar(title: l10n.home)
      ],

      footers: [
        BottomBar(currentIndex: 1)
      ],

      child: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - material.kToolbarHeight,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Widget_Content
                    ZoneSelector(),
                    SizedBox(height: 16),
                    TempMetric(),
                    SizedBox(height: 16),
                    SystemPerformanceMetric(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}