import 'package:covid_19_ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:quartet/quartet.dart';

class WeeklyChart extends StatelessWidget {
  final weeklyData;
  WeeklyChart({this.weeklyData});
  var f= new DateFormat.yMd();
  var curd=new DateTime.now();

  List dialyData=[];
  List<dynamic> getDialyData(){
    for(var i=0;i<7;i++){

      var k=curd.subtract(new Duration(days: i+1));
      var m=f.format(k);
      print(slice(m,0,-2));
      dialyData.add(weeklyData[slice(m,0,-2)]);
      print(dialyData);
      }
    var listDouble = dialyData.map((i) => i.toDouble()).toList();
    return listDouble;

  }

  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio: 1.7,
      child: BarChart(
        BarChartData(
          barGroups: getBarGroups(getDialyData),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: SideTitles(
              showTitles: false,
            ),
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: getWeek,
              textStyle: TextStyle(
                color: Color(0xFF7589A2),
                fontSize: 10,
                fontWeight: FontWeight.w200
              )
            )
          )
        )
      ),
    );
  }
}
getBarGroups(Function getDialyData){

  List<dynamic> barChartDatas=getDialyData();
  List<BarChartGroupData> barChartGroups=[];
  barChartDatas.asMap().forEach(
      (i,value)=>barChartGroups.add(
        BarChartGroupData(
          x:i,
          barRods: [
            BarChartRodData(
              y:value,
              color:i==4?kprimaryColor:kinactiveColor,
              width: 16,
            )
          ]
        )
      )
  );
  return barChartGroups;
}
String getWeek(double value) {
  switch (value.toInt()) {
    case 0:
      return "MON";
    case 1:
      return "TUE";
    case 2:
      return "WED";
    case 3:
      return "THU";
    case 4:
      return "FRI";
    case 5:
      return "SAT";
    case 6:
      return "SUN";
  }
}

