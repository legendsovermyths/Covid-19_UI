import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid_19_ui/constants.dart';
import 'lineChart.dart';

class infoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;
  final Function onTap;

  infoCard({this.title, this.iconColor, this.effectedNum,this.onTap});


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onTap: onTap,
            child: Container(
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
            ),
          );
        }

    );
  }
}