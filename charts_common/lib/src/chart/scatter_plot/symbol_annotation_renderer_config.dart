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

import 'package:charts_common/src/chart/scatter_plot/comparison_points_decorator.dart'
    show ComparisonPointsDecorator;
import 'package:charts_common/src/chart/scatter_plot/point_renderer_config.dart'
    show PointRendererConfig;
import 'package:charts_common/src/chart/scatter_plot/point_renderer_decorator.dart'
    show PointRendererDecorator;
import 'package:charts_common/src/chart/scatter_plot/symbol_annotation_renderer.dart'
    show SymbolAnnotationRenderer;
import 'package:charts_common/src/common/symbol_renderer.dart';

/// Configuration for [SymbolAnnotationRenderer].
///
/// This renderer is configured with a [ComparisonPointsDecorator] by default,
/// used to draw domain ranges. This decorator will draw a rectangular shape
/// between the points (domainLowerBound, measureLowerBound) and
/// (domainUpperBound, measureUpperBound), beneath the primary point for each
/// series.
class SymbolAnnotationRendererConfig<D> extends PointRendererConfig<D> {
  SymbolAnnotationRendererConfig({
    super.customRendererId,
    List<PointRendererDecorator<D>>? pointRendererDecorators,
    super.radiusPx = 5.0,
    super.symbolRenderer,
    super.customSymbolRenderers,
    this.showBottomSeparatorLine = false,
    this.showSeparatorLines = true,
    this.verticalSymbolBottomPaddingPx = 5.0,
    this.verticalSymbolTopPaddingPx = 5.0,
  }) : super(
          pointRendererDecorators: pointRendererDecorators ??
              [
                ComparisonPointsDecorator<D>(
                  symbolRenderer: RectangleRangeSymbolRenderer(),
                ),
              ],
        );

  /// Whether a separator line should be drawn between the bottom row of
  /// rendered symbols and the axis ticks/labels.
  final bool showBottomSeparatorLine;

  /// Whether or not separator lines will be rendered between rows of rendered
  /// symbols.
  final bool showSeparatorLines;

  /// Space reserved at the bottom of each row where the symbol should not
  /// render into.
  final double verticalSymbolBottomPaddingPx;

  /// Space reserved at the top of each row where the symbol should not render
  /// into.
  final double verticalSymbolTopPaddingPx;

  @override
  SymbolAnnotationRenderer<D> build() => SymbolAnnotationRenderer<D>(
        config: this,
        rendererId: customRendererId,
      );
}
