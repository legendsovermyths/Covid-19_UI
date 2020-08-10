import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:covid_19_ui/constants.dart";
import 'package:covid_19_ui/widgets/infoCards.dart';
import 'package:covid_19_ui/widgets/PreventionCard.dart';
import 'package:covid_19_ui/Screens/DetailsPage.dart';
import 'package:intl/intl.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:covid_19_ui/Utilities/CaseModel.dart';
class HomeScreen extends StatefulWidget {
  final data;
  final detailsData;
  HomeScreen({this.data,this.detailsData});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalCases;
  int recovered;
  int deaths;
  int newCases;
  final f = new NumberFormat.compact();
  void updateUI(data){
    setState(() {
      totalCases=data["cases"];
      recovered=data["recovered"];
      deaths=data["deaths"];
      newCases=data["todayCases"];
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    updateUI(widget.data);
  }
  @override

  Widget build(BuildContext context) {


    void onTap(){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailsPage(detailsData: widget.detailsData,newCases: newCases,)),
      );
    }
    return Scaffold(
      appBar: buildAppBar(onTap,updateUI),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
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
                infoCard(onTap:onTap,title: "Total Cases",iconColor: Color(0xFFFF9C00),effectedNum:f.format(totalCases),),
                infoCard(onTap:onTap,title: "Total Deaths",iconColor: Color(0xFFFF2D55),effectedNum: f.format(deaths),),
                infoCard(onTap:onTap,title: "Total Recovered",iconColor: Color(0xFF50E3C2),effectedNum: f.format(recovered),),
                infoCard(onTap:onTap,title: "New Cases",iconColor: Color(0xFF5856D6),effectedNum: f.format(newCases),),

              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Prevention",style:Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold),),
             SizedBox(height: 20,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 PreventionCard(todo: "Wash Hands",image: "hand_wash.svg",),
                 PreventionCard(todo: "Wear Masks",image: "use_mask.svg",),
                 PreventionCard(todo: "Clean Disinfect",image:"Clean_Disinfect.svg" ,)
               ],
             ),
                SizedBox(height: 40,),
                Container(
                  height: 150,
                  width: double.infinity,
                  child:Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left:MediaQuery.of(context).size.width * .4,top: 20, right: 20),
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors:[Color(0xFF60BE93),Color(0xFF1B8D59)]),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: RichText(
                          text:TextSpan(
                            children: [
                              TextSpan(
                                text: "Dial 1075 for \n Medical Help!\n",
                                style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white)
                              ),
                              TextSpan(
                                text: "If any symtoms appear",
                                style: TextStyle(color:Colors.white.withOpacity(0.7))
                              )
                            ]
                          )
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SvgPicture.asset("assets/icons/nurse.svg"),
                        ),
                      Positioned(
                        top: 30,
                        right: 20,
                        child: SvgPicture.asset("assets/icons/virus.svg"),
                      )

                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}




AppBar buildAppBar(Function onTap,Function onPressed){
  return AppBar(
    backgroundColor: kprimaryColor.withOpacity(0.03),
    elevation: 0,
    leading: IconButton(

      icon:SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: onTap,
    ),
    actions: <Widget>[



       CountryListPick(
  // to show or hide flag
            isShowFlag: false,
            // true to show  title country
            isShowTitle: true,
            // true to show code phone country
            isShowCode: false,

            isDownIcon: false,

            showEnglishName: true,

            initialSelection: '+91',

            onChanged: (CountryCode code) async{

              CaseModel model=CaseModel(countryCode: code.code);
              var data=await model.getWorldWidedata();
              onPressed(data);
            },
            )


    ],
  );
}

