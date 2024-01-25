import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PertumbuhanAnak {
  PertumbuhanAnak(this.bulan, this.tinggi);
  final DateTime bulan;
  final double tinggi;
}

class GrafikPertumbuhanAnak extends StatefulWidget {
  const GrafikPertumbuhanAnak({Key? key}) : super(key: key);

  @override
  State<GrafikPertumbuhanAnak> createState() => _GrafikPertumbuhanAnakState();
}

class _GrafikPertumbuhanAnakState extends State<GrafikPertumbuhanAnak> {
  late TooltipBehavior _tooltipBehavior;
  final List<PertumbuhanAnak> chartData = [
    PertumbuhanAnak(DateTime(0), 35),
    PertumbuhanAnak(DateTime(1), 40),
    PertumbuhanAnak(DateTime(2), 45),
    PertumbuhanAnak(DateTime(3), 50),
    PertumbuhanAnak(DateTime(4), 55)
  ];

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
      animationDuration: 200,
      duration: 2000,
      enable: true,
      builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
          int seriesIndex) {
        final PertumbuhanAnak dataPoint = chartData[pointIndex];
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.orange, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bulan $pointIndex : ${dataPoint.tinggi} cm'),
              const SizedBox(height: 5),
              const Text('Baik', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 340,
          child: SfCartesianChart(
            tooltipBehavior: _tooltipBehavior,
            primaryXAxis: DateTimeAxis(
              title: AxisTitle(
                text: 'Usia (Bulan)',
                textStyle: bodyMedium(
                  colorFont: greyColor,
                  sizeFont: 14,
                ),
              ),
            ),
            primaryYAxis: NumericAxis(
              title: AxisTitle(
                text: 'Tinggi (Cm)',
                textStyle: bodyMedium(
                  colorFont: greyColor,
                  sizeFont: 14,
                ),
              ),
            ),
            series: <CartesianSeries>[
              // Renders line chart
              LineSeries<PertumbuhanAnak, DateTime>(
                dataSource: chartData,
                xValueMapper: (PertumbuhanAnak sales, _) => sales.bulan,
                yValueMapper: (PertumbuhanAnak sales, _) => sales.tinggi,
                color: Colors.orange,
                markerSettings: const MarkerSettings(
                  isVisible: true,
                  shape: DataMarkerType.circle,
                  borderColor: Colors.orange,
                  borderWidth: 2,
                  color: Colors.white,
                  height: 10,
                  width: 10,
                ),
                enableTooltip: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
