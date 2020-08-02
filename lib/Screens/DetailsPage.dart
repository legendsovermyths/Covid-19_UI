import 'package:covid_19_ui/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid_19_ui/widgets/WeeklyChart.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context),
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
                  BuildCaseNumber(),
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
                  WeeklyChart(),
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
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "547 ",
          style: Theme.of(context)
              .textTheme
              .headline2
              .copyWith(color: kprimaryColor, height: 1.2),
        ),
        Text(
          "+5.9%",
          style: TextStyle(color: kprimaryColor),
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

AppBar buildAppbar(BuildContext context) {
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
        onPressed: () {},
      )
    ],
  );
}
