import 'Networking.dart';

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
}