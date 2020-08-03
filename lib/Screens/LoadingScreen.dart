import 'package:covid_19_ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_ui/Utilities/CaseModel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:covid_19_ui/Screens/home_screen.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  CaseModel model=CaseModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWorldWideData();
  }
  void getWorldWideData()async{
    var data=await model.getWorldWidedata();
    Navigator.push(context, MaterialPageRoute(builder: (context){return HomeScreen(data:data,);}));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitChasingDots(
          color: kprimaryColor,
        ),
      ),
    );

  }
}
