import 'package:app/services/screen_size_calculator.dart';
import 'package:flutter/material.dart';

class ColumnSpacer extends StatelessWidget {
  const ColumnSpacer(this.size, {super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return SizedBox(
      height: ScreenUtils.height * size,
    );
  }
}

class RowSpacer extends StatelessWidget {
  const RowSpacer(this.size, {super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return SizedBox(
      width: ScreenUtils.width * size,
    );
  }
}
