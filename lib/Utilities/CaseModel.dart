import 'Networking.dart';
import 'package:intl/intl.dart';
import 'package:quartet/quartet.dart';

class CaseModel{
  final String countryCode;
  CaseModel({this.countryCode="IND"});
  Future getWorldWidedata() async{
    String url1="https://disease.sh/v3/covid-19/countries/$countryCode";
    Networking networking=Networking(url: url1);
    var data=await networking.getdata();
    print(data);
    return data;
  }
  Future getDetailsPageData() async{
    String url2="https://disease.sh/v3/covid-19/historical/$countryCode?lastdays=14";
    Networking networking_2=Networking(url:url2);
    var data=await networking_2.getdata();

    return data;
  }
}