import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get deviceHeight => MediaQuery.sizeOf(this).height;
  double get deviceWidth => MediaQuery.sizeOf(this).width;
}

extension DoubleExtension on num {
  Widget get verticalSpace => SizedBox(height: toDouble());
  Widget get horizontalSpace => SizedBox(width: toDouble());
}
