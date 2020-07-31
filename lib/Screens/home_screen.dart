import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:covid_19_ui/constants.dart";
import 'package:covid_19_ui/widgets/lineChart.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 40),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kprimaryColor.withOpacity(0.03),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )
        ),
        child: Wrap(
          runSpacing: 20,
          spacing: 20,
          children: <Widget>[
            infoCard(title: "Total Cases",iconColor: Color(0xFFFF9C00),effectedNum: 1024,),
            infoCard(title: "Total Deaths",iconColor: Color(0xFFFF2D55),effectedNum: 75,),
            infoCard(title: "Total Recovered",iconColor: Color(0xFF50E3C2),effectedNum: 689,),
            infoCard(title: "Total Deaths",iconColor: Color(0xFF5856D6),effectedNum: 75,),

          ],
        ),
      ),
    );
  }
}

class infoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;

  infoCard({this.title, this.iconColor, this.effectedNum});


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth/2-10,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: iconColor.withOpacity(0.12),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset("assets/icons/running.svg",
                          height: 12,
                          width: 12,
                        color: iconColor,),

                      ),
                      SizedBox(width: 5),
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(color: ktextColor),
                              children: [
                                TextSpan(
                                    text: "${effectedNum}\n",
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(fontWeight: FontWeight.bold)
                                ),
                                TextSpan(
                                    text: "People",
                                    style: TextStyle(
                                      fontSize: 12,
                                      height: 2,

                                    )
                                )
                              ]
                          ),
                        ),
                      ),
                      Expanded(
                        child: LineReportChart(),
                      ),

                    ],
                  ),
                )
              ],
            ),
          );
        }

    );
  }
}
AppBar buildAppBar(){
  return AppBar(
    backgroundColor: kprimaryColor.withOpacity(0.03),
    elevation: 0,
    leading: IconButton(
      icon:SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: (){},
    ),
    actions: <Widget>[
      IconButton(
        icon:SvgPicture.asset("assets/icons/search.svg"),
        onPressed: (){},
      )
    ],
  );
}

