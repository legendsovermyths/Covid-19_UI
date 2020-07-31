import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:covid_19_ui/constants.dart";
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
          children: <Widget>[
            Container(
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
                            color: Color(0xFFFF9C00).withOpacity(0.12),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset("assets/icons/running.svg",
                          height: 12,
                          width: 12,),

                        ),
                        SizedBox(width: 5),
                        Text(
                          "Confirmed Cases",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          style:TextStyle(color: ktextColor),
                          children: [
                            TextSpan(
                                text: "1,062",
                              style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold)
                            ),
                            TextSpan(
                              text:"People"
                            )
                          ]
                        ),
                      )
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