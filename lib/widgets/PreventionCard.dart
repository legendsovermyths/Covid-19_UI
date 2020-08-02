import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_ui/constants.dart';
class PreventionCard extends StatelessWidget {
  final String todo;
  final String image;
  PreventionCard({this.todo,this.image});
  @override
  Widget build(BuildContext context) {
    return Column(

      children: <Widget>[
        SvgPicture.asset("assets/icons/${image}"),
        Text("${todo}",style:Theme.of(context).textTheme.bodyText1.copyWith(color: kprimaryColor))
      ],
    );
  }
}