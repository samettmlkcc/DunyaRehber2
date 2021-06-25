import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class graphs extends StatefulWidget {
  @override
  graphs_State createState() => graphs_State();
}

class graphs_State extends State<graphs> {
  List<charts.Series> seriesList;

  static List<charts.Series<Sales, String>> _createRandomData() {
    final random = Random();
    final salesData = [
      Sales('2015', random.nextInt(10000)),
      Sales('2016', random.nextInt(12000)),
      Sales('2017', random.nextInt(13000)),
      Sales('2018', random.nextInt(15000)),
      Sales('2019', random.nextInt(13000)),
      Sales('2020', random.nextInt(11000)),
    ];

    return [
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: salesData,
      )
    ];
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seriesList = _createRandomData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yıllara Göre Turist Alımı'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: barChart(),
      ),
    );
  }
}

class Sales {
  final String year;
  final int sales;

  Sales(this.year, this.sales);
}
