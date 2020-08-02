import 'package:covid_19_ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,21),
                    blurRadius: 53,
                    color: Colors.black.withOpacity(0.05),
                  )
                ]
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("New Cases")
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
AppBar buildAppbar(BuildContext context){
  return AppBar(
    elevation: 0,
    backgroundColor: kbackgroundColor,

    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      color: kprimaryColor,
      onPressed: (){
        Navigator.pop(context);
      },
    ),
    actions: <Widget>[
      IconButton(

        icon: SvgPicture.asset("assets/icons/search.svg",),

        onPressed: (){},
      )
    ],
  );
}