import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  late List<GDPData> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Color(0xFF00695B)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "My Activity",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 25),
                const Text(
                  "keep Moving Every Day To Meet \nYour Tree Goal",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFFB4B4B4)),
                ),
                const SizedBox(height: 25),
                SfCartesianChart(
                  series: <ChartSeries>[
                    ColumnSeries<GDPData, String>(
                      dataSource: _chartData,
                      xValueMapper: (GDPData day, _) => day.day,
                      yValueMapper: (GDPData day, _) => day.tree,
                      pointColorMapper: (GDPData day, _) => day.color,
                    ),
                  ],
                  primaryXAxis: CategoryAxis(),
                ),
                const SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFEEF6E2),
                      borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          color: const Color(0xFF8BC24A),
                          child: Column(
                            children: const [
                              Text(
                                "Sep",
                                style: TextStyle(color: Color(0xFFFFFFFF)),
                              ),
                              Text(
                                "15",
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Most Steps",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Tuesday",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFB4B4B4),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Text(
                        "6 Kms",
                        style: TextStyle(
                            color: Color(0xFF8CC34B),
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('13 Sep', 4.0, const Color(0xFF8CC34B)),
      GDPData('14 Sep', 5.0, const Color(0xFF8CC34B)),
      GDPData('15 Sep', 6.0, const Color(0xFF8CC34B)),
      GDPData('16 Sep', 5.0, const Color(0xFF8CC34B)),
      GDPData('17 Sep', 4.7, const Color(0xFF8CC34B)),
      GDPData('18 Sep', 5.1, const Color(0xFF8CC34B)),
      GDPData('19 Sep', 5.2, const Color(0xFF8CC34B)),
    ];
    return chartData;
  }
}

class GDPData {
  final String day;
  final double tree;
  final Color color;

  GDPData(this.day, this.tree, this.color);
}
