import 'package:covid_19_tracker/model/worldWide_model.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

// ignore: must_be_immutable
class PieChartWorldwide extends StatelessWidget {
  final WorldwideDataModel? worldwideDataModelPie;

  const PieChartWorldwide({Key? key,@required this.worldwideDataModelPie}) : super(key: key);
  // Map worldwideDataModelPie;
  // PieChartWorldwide({required this.worldwideDataModelPie});
  @override
  Widget build(BuildContext context) {
    Map<String, double> mapData = {
      'Confirmed': worldwideDataModelPie!.cases!.toDouble(),
      'Active': worldwideDataModelPie!.active!.toDouble(),
      'Recovered': worldwideDataModelPie!.recovered!.toDouble(),
      'Deaths': worldwideDataModelPie!.deaths!.toDouble(),
    };
    return PieChart(
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: false,
        showChartValuesInPercentage: true,
      ),
      dataMap: mapData,
      colorList: [Colors.red, Colors.blue, Colors.green, Colors.grey],
    );
  }
}
