import 'package:app/helpers/colors.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalanceSummaryChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.sp),
      child: Container(
        decoration: BoxDecoration(
          color: HexColor("#F8F8F8"),
          borderRadius: BorderRadius.circular(16),
          // boxShadow: [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Statistics',
                    style: commonTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: AppColors.primaryBlackColor),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: HexColor("#DDE8FE"),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Past 6 months',
                      style: commonTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: AppColors.primaryBlackColor),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.sp),
              child: AspectRatio(
                aspectRatio: 1.7,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: true),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles:
                            SideTitles(showTitles: true, reservedSize: 40),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const months = [
                              'Jan',
                              'Feb',
                              'Mar',
                              'Apr',
                              'May',
                              'Jun'
                            ];
                            return Padding(
                              padding: EdgeInsets.only(top: 8.sp),
                              child: Text(
                                months[value.toInt()],
                                style: TextStyle(fontSize: 10.sp),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 2100),
                          FlSpot(1, 2300),
                          FlSpot(2, 2700),
                          FlSpot(3, 2400),
                          FlSpot(4, 2000),
                          FlSpot(5, 1400),
                        ],
                        isCurved: true,
                        color: HexColor("#8979FF"),
                        // colors: [Colors.blueAccent],
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: true),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              HexColor("#8979FF").withOpacity(0.3),
                              HexColor("#8979FF").withOpacity(0.05),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ), // color:
                          // colors: [Colors.blueAccent.withOpacity(0.3)],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
