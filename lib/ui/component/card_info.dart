import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:flutter/material.dart' as material;
import 'package:smartfarm_mobile/ui/settings.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesData {
  final String year;
  final double sales;

  SalesData(this.year, this.sales);
}

class CardInfo extends HookWidget {
  final String metricName;
  final String data;
  final String latestUpdate;
  final Icon metricIcon;
  final Widget? chartWidget;

  const CardInfo({
    Key? key,
    this.metricIcon = const Icon(Icons.info, color: Colors.black),
    this.metricName = 'Metric Name',
    this.data = 'Data',
    this.latestUpdate = 'YYYY-MM-DD hh:mm:ss',
    this.chartWidget = null,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appFont = useValueListenable(Settings.appFont);
    
    return Card(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(metricName, style: appFont).x2Large().medium(),
              Spacer(),
              metricIcon,
            ],
          ),

          SizedBox(
            width: double.maxFinite,
            height: 225,
            child: chartWidget,
          ),

          const SizedBox(height: 16),
          Text(data, style: appFont).extraBold(),
          
          Row(
            children: [
              Text('Latest update ', style: appFont).muted().small().p(),
              Spacer(),
              Text(latestUpdate, style: appFont).muted().small().p(),
            ],
          ),
        ],
      ),
    ).intrinsic(stepHeight: 10);
  }
}
