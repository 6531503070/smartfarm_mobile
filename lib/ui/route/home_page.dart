import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart' as material;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartfarm_mobile/ui/component/bottom_bar.dart';
import 'package:smartfarm_mobile/ui/component/card_info.dart';
import 'package:smartfarm_mobile/ui/component/top_bar.dart';
import 'package:smartfarm_mobile/ui/component/zone_widget.dart';
import 'package:smartfarm_mobile/ui/hook/use_l10n.dart';
import 'package:smartfarm_mobile/ui/theme/app_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final colors = AppColors.light();

    return Scaffold(
      headers: [TopBar(title: l10n.home)],
      footers: [BottomBar(currentIndex: 1)],
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ZoneSelector(),
              SizedBox(height: 16),

              // Metric "Water Usage"
              CardInfo(
                  metricIcon: Icon(Icons.water_drop_sharp,
                      size: 32, color: Colors.blue),
                  metricName: l10n.waterUsage,
                  chartWidget: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    series: <CartesianSeries>[
                      ColumnSeries<SalesData, String>(
                        dataSource: <SalesData>[
                          SalesData('Jan', 35),
                          SalesData('Feb', 28),
                          SalesData('Mar', 34),
                          SalesData('Apr', 32),
                          SalesData('May', 40)
                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                        color: Colors.blue,
                      )
                    ],
                  ),
                  data: "640 L / minute",
                  latestUpdate: "2021-10-10 10:10:10"),

              SizedBox(height: 16),

              // Metric "Avg. Temperature"
              CardInfo(
                  metricIcon: Icon(Icons.thermostat_rounded,
                      size: 32, color: Colors.red),
                  metricName: l10n.avgTemperature,
                  chartWidget: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    series: <CartesianSeries>[
                      LineSeries<SalesData, String>(
                        dataSource: <SalesData>[
                          SalesData('Jan', 35),
                          SalesData('Feb', 28),
                          SalesData('Mar', 34),
                          SalesData('Apr', 32),
                          SalesData('May', 40)
                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                        color: Colors.red,
                      )
                    ],
                  ),
                  data: "25.0°C / minute",
                  latestUpdate: "2021-10-10 10:10:10"),

              SizedBox(height: 16),

              // Metric "Avg. Rainfall"
              CardInfo(
                  metricIcon: Icon(LucideIcons.cloudRain,
                      size: 32, color: Colors.purple),
                  metricName: l10n.avgRainfall,
                  chartWidget: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    series: <CartesianSeries>[
                      BarSeries<SalesData, String>(
                        dataSource: <SalesData>[
                          SalesData('Jan', 0),
                          SalesData('Feb', 0.1),
                          SalesData('Mar', 0),
                          SalesData('Apr', 0),
                          SalesData('May', 0.5)
                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                        color: Colors.purple,
                      )
                    ],
                  ),
                  data: "0.0 mm / minute",
                  latestUpdate: "2021-10-10 10:10:10"),
            ],
          ),
        ),
      ),
    );
  }
}
