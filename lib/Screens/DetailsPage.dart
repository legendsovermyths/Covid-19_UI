import 'package:covid_19_ui/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid_19_ui/widgets/WeeklyChart.dart';
import 'package:intl/intl.dart';


class DetailsPage extends StatefulWidget {
  final detailsData;
  final newCases;
  DetailsPage({this.detailsData,this.newCases});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final f = new NumberFormat.compact();
  void printData(){
    print(widget.detailsData['timeline']['cases']);
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context,printData),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 21),
                      blurRadius: 53,
                      color: Colors.black.withOpacity(0.05),
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BuildTitleScreenWithMoreIcon(),
                  SizedBox(
                    height: 15,
                  ),
                  BuildCaseNumber(newCases: f.format(widget.newCases),),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "From Health Center",
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: ktextMediumColor,
                        fontSize: 16),
                  ),
                  WeeklyChart(weeklyData:widget.detailsData['timeline']['cases']),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      BuildInfoWithPercentage(
                        percentage: "6.45%",
                        status: "From Last Week",
                      ),
                      BuildInfoWithPercentage(
                        percentage: "9.43%",
                        status: "Recovery Rate",
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 21),
                      blurRadius: 54,
                      color: Colors.black.withOpacity(0.05),
                    )
                  ]),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Global Map",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SvgPicture.asset("assets/icons/more.svg")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset("assets/icons/map.svg")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildInfoWithPercentage extends StatelessWidget {
  final String percentage;
  final String status;
  BuildInfoWithPercentage({this.status, this.percentage});
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "${percentage}\n",
          style: TextStyle(
            fontSize: 20,
            color: kprimaryColor,
          )),
      TextSpan(
          text: "${status}",
          style: TextStyle(
            color: ktextMediumColor,
            height: 1.5,
          ))
    ]));
  }
}

class BuildCaseNumber extends StatelessWidget {
  final newCases;
  BuildCaseNumber({this.newCases});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          newCases,
          style: Theme.of(context)
              .textTheme
              .headline2
              .copyWith(color: kprimaryColor, height: 1.2),
        ),

      ],
    );
  }
}

class BuildTitleScreenWithMoreIcon extends StatelessWidget {
  const BuildTitleScreenWithMoreIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "New Cases",
          style: TextStyle(
            color: ktextColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        SvgPicture.asset("assets/icons/more.svg")
      ],
    );
  }
}

AppBar buildAppbar(BuildContext context,Function printdata) {
  return AppBar(
    elevation: 0,
    backgroundColor: kbackgroundColor,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      color: kprimaryColor,
      onPressed: () {

        Navigator.pop(context);
      },
    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset(
          "assets/icons/search.svg",
        ),
        onPressed:printdata,
      )
    ],
  );
}
