import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartfarm_mobile/gen/assets.gen.dart';
import 'package:smartfarm_mobile/ui/component/bottom_bar.dart';
import 'package:smartfarm_mobile/ui/component/system_performance_metric.dart';
import 'package:smartfarm_mobile/ui/component/top_bar.dart';
import 'package:smartfarm_mobile/ui/hook/use_l10n.dart';
import 'package:smartfarm_mobile/ui/theme/app_colors.dart';

class HomePage extends StatefulHookWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final colors = AppColors.light();

    return Scaffold(
      appBar: TopBar(title: l10n.home),
      
      backgroundColor: colors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            // Container(
            //   height: 300, // Set the height of the chart
            //   padding: const EdgeInsets.all(16.0),
            //   child: LineChart(
            //     LineChartData(
            //       gridData: FlGridData(show: true),
            //       titlesData: FlTitlesData(show: true),
            //       borderData: FlBorderData(show: true),
            //       lineBarsData: [
            //         LineChartBarData(
            //           spots: [
            //             FlSpot(0, 1),
            //             FlSpot(1, 3),
            //             FlSpot(2, 1),
            //             FlSpot(3, 4),
            //           ],
            //           isCurved: true,
            //           color: Color.fromRGBO(255, 200, 100, 0),
            //           barWidth: 4,
            //           belowBarData: BarAreaData(show: false),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            SystemPerformanceMetric(),

          ],
        ),
      ),

      bottomNavigationBar: BottomBar(currentIndex: 1),
    );
  }
}