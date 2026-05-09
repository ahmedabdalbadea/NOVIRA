import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/features/home/view/data/models/weekly_assessment_model.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';

class WeeklyProgressChart extends StatelessWidget {
  const WeeklyProgressChart({super.key, required this.weeklyData});

  final List<WeeklyAssessment> weeklyData; // بيجي من الـ DB أو State

  @override
  Widget build(BuildContext context) {
    // تحويل البيانات لـ FlSpot
    final spots = weeklyData.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.totalScore.toDouble());
    }).toList();

    return OnboardingCardBody(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Your Weekly Progress", style: Styles.textStyle18),
              const Icon(Icons.trending_up, color: kEndSecGradientColor),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 150,
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: (weeklyData.length - 1).toDouble(),
                minY: 0,
                maxY: 27, // أقصى score في PHQ-9 هو 27
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index < 0 || index >= weeklyData.length) {
                          return const SizedBox();
                        }
                        // بيعرض تاريخ كل أسبوع
                        final date = weeklyData[index].date;
                        return Text(
                          '${date.day}/${date.month}',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[400],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: Colors.blue[300],
                    barWidth: 3,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, bar, index) =>
                          FlDotCirclePainter(
                            radius: 5,
                            color: Colors.blue[300]!,
                            strokeWidth: 2,
                            strokeColor: Colors.white,
                          ),
                    ),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.center,
            child: Text(
              _getProgressMessage(),
              style: Styles.textStyle14.copyWith(color: kDesTextColor),
            ),
          ),
        ],
      ),
    );
  }

  // رسالة بناءً على التحسن أو التراجع
  String _getProgressMessage() {
    if (weeklyData.length < 2) return "Keep tracking your mood weekly 💙";

    final lastScore = weeklyData.last.totalScore;
    final prevScore = weeklyData[weeklyData.length - 2].totalScore;

    if (lastScore < prevScore) {
      return "You're improving compared to last week 💙";
    } else if (lastScore > prevScore) {
      return "Hang in there, things will get better 🌱";
    } else {
      return "You're staying consistent this week 💪";
    }
  }
}
