// Copyright 2018 the Charts project authors. Please see the AUTHORS file
// for details.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// EXCLUDE_FROM_GALLERY_DOCS_START
// ignore_for_file: lines_longer_than_80_chars

import 'dart:math';

import 'package:flutter/material.dart';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:nimble_charts/flutter.dart' as charts;

/// This is a line chart with a title text in every margin.
///
/// A series of [charts.ChartTitle] behaviors are used to render titles, one per
/// margin.
class ChartTitleLine extends StatelessWidget {
  const ChartTitleLine(this.seriesList, {super.key, this.animate = true});

  /// Creates a [charts.LineChart] with sample data and no transition.
  factory ChartTitleLine.withSampleData() => ChartTitleLine(
        _createSampleData(),
      );

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory ChartTitleLine.withRandomData() =>
      ChartTitleLine(_createRandomData());
  final List<charts.Series<dynamic, num>> seriesList;
  final bool animate;

  /// Create random data.
  static List<charts.Series<LinearSales, num>> _createRandomData() {
    final random = Random();

    final data = [
      LinearSales(0, random.nextInt(100)),
      LinearSales(1, random.nextInt(100)),
      LinearSales(2, random.nextInt(100)),
      LinearSales(3, random.nextInt(100)),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (sales, _) => sales.year,
        measureFn: (sales, _) => sales.sales,
        data: data,
      ),
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) => charts.LineChart(
        seriesList,
        animate: animate,
        // Configures four [ChartTitle] behaviors to render titles in each chart
        // margin. The top title has a sub-title, and is aligned to the left edge
        // of the chart. The other titles are aligned with the middle of the draw
        // area.
        behaviors: [
          charts.ChartTitle(
            'Top title text',
            subTitle: 'Top sub-title text',
            behaviorPosition: charts.BehaviorPosition.top,
            titleOutsideJustification: charts.OutsideJustification.start,
            // Set a larger inner padding than the default (10) to avoid
            // rendering the text too close to the top measure axis tick label.
            // The top tick label may extend upwards into the top margin region
            // if it is located at the top of the draw area.
            innerPadding: 18,
          ),
          charts.ChartTitle(
            'Bottom title text',
            behaviorPosition: charts.BehaviorPosition.bottom,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea,
          ),
          charts.ChartTitle(
            'Start title',
            behaviorPosition: charts.BehaviorPosition.start,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea,
          ),
          charts.ChartTitle(
            'End title',
            behaviorPosition: charts.BehaviorPosition.end,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea,
          ),
        ],
      );

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      LinearSales(0, 5),
      LinearSales(1, 25),
      LinearSales(2, 100),
      LinearSales(3, 75),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (sales, _) => sales.year,
        measureFn: (sales, _) => sales.sales,
        data: data,
      ),
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  LinearSales(this.year, this.sales);
  final int year;
  final int sales;
}
