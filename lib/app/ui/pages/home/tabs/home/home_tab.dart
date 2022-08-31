import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesis_1/app/tmp_graphic.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          const Text("Gráfico TPM"),
          const SizedBox(height: 20),
          Center(
              /*child: SizedBox(
                height: 350.0,
                width: 350.0,
                child: SimpleTimeSeriesChart.withSampleData()),*/
              ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
