import 'package:app_treewo/screens/activity_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:app_treewo/widgets/leaderboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<GDPData>? _chartData;
  int steps = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _chartData = getChartData();

    timer = Timer.periodic(const Duration(seconds: 15), (_) {
      setState(() {
        steps++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: const [
                  SizedBox(width: 30),
                  Text(
                    "Hi, Edgar",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'You Have Walked\n',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                  children: [
                    TextSpan(
                      text: '65% ',
                      style: TextStyle(
                        color: Color(0xFF8EC54F),
                      ),
                    ),
                    TextSpan(
                      text: ' Of Your Goal',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SfCircularChart(
                series: <CircularSeries>[
                  RadialBarSeries<GDPData, String>(
                    dataSource: _chartData,
                    xValueMapper: (GDPData data, _) => data.activity,
                    yValueMapper: (GDPData data, _) => data.steps,
                    pointColorMapper: (GDPData data, _) => data.color,
                    cornerStyle: CornerStyle.bothCurve,
                    maximumValue: 300,
                  ),
                ],
                annotations: <CircularChartAnnotation>[
                  CircularChartAnnotation(
                    height: '80%',
                    width: '100%',
                    widget: Column(
                      children: [
                        Text(
                          '$steps',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 50),
                        ),
                        const Text(
                          'Árboles\nSembrados',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/images/walking.svg"),
                        const SizedBox(width: 5),
                        const Text("Walking")
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ActivityScreen()),
                      );
                    },
                  ),
                  const SizedBox(width: 25),
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/images/biking.svg"),
                        const SizedBox(width: 5),
                        const Text("Walking")
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: const Color(0xFFEFEBEB),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "LEADERBOARD",
                          style: TextStyle(
                            color: Color(0xFF8EC54F),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Top Of Groups With The Largest Trees Planted",
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Leaderboard(
                      title: "Mejores de Bogotá",
                      subtitle: "14 Árboles",
                      icon: "first",
                    ),
                    const SizedBox(height: 8),
                    const Leaderboard(
                      title: "Salvando El Planeta",
                      subtitle: "11 Árboles",
                      icon: "second",
                    ),
                    const SizedBox(height: 8),
                    const Leaderboard(
                      title: "Super Heroes",
                      subtitle: "7 Árboles",
                      icon: "third",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Walking', 200, const Color(0xFF8CC34B)),
      GDPData('Cycling', 249, const Color(0xFF00695B)),
    ];
    return chartData;
  }
}

class GDPData {
  final String activity;
  final int steps;
  final Color color;

  GDPData(this.activity, this.steps, this.color);
}
