// ignore_for_file: prefer_const_constructors

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<charts.Series<dynamic, DateTime>> seriesList;
  final bool animate;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  SimpleTimeSeriesChart(this.seriesList, {required this.animate});

  factory SimpleTimeSeriesChart.withSampleData(data) {
    return SimpleTimeSeriesChart(
      _createSampleData(data),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      primaryMeasureAxis: charts.NumericAxisSpec(
        tickProviderSpec: charts.BasicNumericTickProviderSpec(
          desiredTickCount: 7,
        ),
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData(
      data) {
    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Tasa de interés',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales value, _) => value.time,
        measureFn: (TimeSeriesSales value, _) => value.value,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final double value;

  TimeSeriesSales(this.time, this.value);
}
