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

import 'dart:ui' as ui;

import 'package:nimble_charts/flutter.dart';
import 'package:nimble_charts_common/common.dart' as common show Color;

class ColorUtil {
  static ui.Color toDartColor(common.Color color) => color.toDartColor();

  static common.Color fromDartColor(ui.Color color) => color.fromDartColor();
}

extension ColorExtensions on Color {
  ui.Color toDartColor() => ui.Color.fromARGB(a, r, g, b);

  Color withAlpha(double alpha) => Color(
        r: r,
        g: g,
        b: b,
        a: (a * alpha).round(),
      );
}

extension UIColorExtensions on ui.Color {
  common.Color fromDartColor() => common.Color(
        r: red,
        g: green,
        b: blue,
        a: alpha,
      );
}
