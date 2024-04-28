import 'package:cookers_app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../utils/assets_const.dart';

class CustomPieChart extends StatelessWidget {
  final bool? health;
  final bool? form;
  final String? harvestDate;
  const CustomPieChart({
    super.key,
    this.health,
    this.harvestDate = '20 days',
    this.form = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SfCircularChart(
          series: _getRadialBarDefaultSeries(health: health),
        ),
        fieldColumn(form: form, context: context),
      ],
    );
  }
}

Positioned fieldColumn({
  String? date = '20 days',
  bool? form,
  required BuildContext context,
}) {
  return Positioned.fill(
    top: 40,
    left: 0,
    child: Column(
      children: [
        Image.asset(
          AssetConst.wheat,
          width: 65,
          height: 65,
        ),
        const SizedBox(height: 10),
        Text(
          date!,
          style: context.mediumTextStyle,
        ),
      ],
    ),
  );
}

List<RadialBarSeries<ChartSampleData, String>> _getRadialBarDefaultSeries({
  bool? health = false,
}) {
  return <RadialBarSeries<ChartSampleData, String>>[
    RadialBarSeries<ChartSampleData, String>(
      maximumValue: 15,
      dataLabelSettings: const DataLabelSettings(
        isVisible: true,
        textStyle: TextStyle(fontSize: 10.0),
      ),
      dataSource: <ChartSampleData>[
        ChartSampleData(
          x: '',
          y: 5,
          text: 'Salam',
          pointColor: Colors.green,
        ),
      ],
      cornerStyle: CornerStyle.bothCurve,
      gap: '89%',
      radius: '160%',
      xValueMapper: (ChartSampleData data, _) => data.x,
      yValueMapper: (ChartSampleData data, _) => data.y,
      pointRadiusMapper: (ChartSampleData data, _) => data.text,
      pointColorMapper: (ChartSampleData data, _) => data.pointColor,
      dataLabelMapper: (ChartSampleData data, _) => data.x,
    )
  ];
}

class ChartSampleData {
  String? x, text;
  double? y;
  Color? pointColor;
  ChartSampleData({
    this.pointColor,
    this.text,
    this.x,
    this.y,
  });
}
