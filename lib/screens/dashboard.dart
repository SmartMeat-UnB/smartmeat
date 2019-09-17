import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample1 extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => LineChartSample1State();

}

class LineChartSample1State extends State<LineChartSample1> {

  StreamController<LineTouchResponse> controller;
  @override
  void initState() {
    super.initState();

    controller = StreamController();
    controller.stream.distinct().listen((LineTouchResponse response){});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(

          children: <Widget>[
            SizedBox(height: 260,),

            AspectRatio(
              aspectRatio: 1.23,
              child: Card(
                margin: EdgeInsets.only(left: 100.0, right: 60.0, top: 50.0 ),

                child: Container(
                   decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff2c274c),
                          Color(0xff46426c),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                      SizedBox(
                        height: 4,
                      ),
                      Text("Espetos por Hora", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 2), textAlign: TextAlign.center,),
                      SizedBox(
                        height: 37,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                          child: FlChart(
                            chart: LineChart(
                              LineChartData(
                                lineTouchData: LineTouchData(
                                    touchResponseSink: controller.sink,
                                    touchTooltipData: TouchTooltipData (
                                      tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
                                    )
                                ),
                                gridData: FlGridData(
                                  show: false,
                                ),
                                titlesData: FlTitlesData(
                                  bottomTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 22,
                                    textStyle: TextStyle(
                                      color: const Color(0xff72719b),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    margin: 10,
                                    getTitles: (value) {
                                      switch(value.toInt()) {
                                        case 2:
                                          return '1h';
                                        case 7:
                                          return '2h';
                                        case 12:
                                          return '3h';
                                      }
                                      return '';
                                    },
                                  ),
                                  leftTitles: SideTitles(
                                    showTitles: true,
                                    textStyle: TextStyle(
                                      color: Color(0xff75729e),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    getTitles: (value) {
                                      switch(value.toInt()) {
                                        case 1: return '1';
                                        case 2: return '2';
                                        case 3: return '3';
                                        case 4: return '5';
                                      }
                                      return '';
                                    },
                                    margin: 8,
                                    reservedSize: 30,
                                  ),
                                ),
                                borderData: FlBorderData(
                                    show: true,
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color(0xff4e4965),
                                        width: 4,
                                      ),
                                      left: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      right: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      top: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    )
                                ),
                                minX: 0,
                                maxX: 14,
                                maxY: 4,
                                minY: 0,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: [
                                      FlSpot(1, 1),
                                      FlSpot(3, 1.5),
                                      FlSpot(5, 1.4),
                                      FlSpot(7, 3.4),
                                      FlSpot(10, 2),
                                      FlSpot(12, 2.2),
                                      FlSpot(13, 1.8),
                                    ],
                                    isCurved: true,
                                    colors: [
                                      Color(0xff4af699),
                                    ],
                                    barWidth: 8,
                                    isStrokeCapRound: true,
                                    dotData: FlDotData(
                                      show: false,
                                    ),
                                    belowBarData: BelowBarData(
                                      show: false,
                                    ),
                                  ),
                                  LineChartBarData(
                                    spots: [
                                      FlSpot(1, 1),
                                      FlSpot(3, 2.8),
                                      FlSpot(7, 1.2),
                                      FlSpot(10, 2.8),
                                      FlSpot(12, 2.6),
                                      FlSpot(13, 3.9),
                                    ],
                                    isCurved: true,
                                    colors: [
                                      Color(0xffaa4cfc),
                                    ],
                                    barWidth: 8,
                                    isStrokeCapRound: true,
                                    dotData: FlDotData(
                                      show: false,
                                    ),
                                    belowBarData: BelowBarData(
                                      show: false,
                                    ),
                                  ),
                                  LineChartBarData(
                                    spots: [
                                      FlSpot(1, 2.8),
                                      FlSpot(3, 1.9),
                                      FlSpot(6, 3),
                                      FlSpot(10, 1.3),
                                      FlSpot(13, 2.5),
                                    ],
                                    isCurved: true,
                                    colors: [
                                      Color(0xff27b6fc),
                                    ],
                                    barWidth: 8,
                                    isStrokeCapRound: true,
                                    dotData: FlDotData(
                                      show: false,
                                    ),
                                    belowBarData: BelowBarData(
                                      show: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(height: 10,),
                    ],
                  ),
                ),
              )

            )
          ]
      ),

    );

  }

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }

}