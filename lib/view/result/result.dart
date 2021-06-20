import 'package:flutter/material.dart';
import 'package:miras/controller/global_state.dart';
import 'package:miras/controller/rank_calculator.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/view/start_page.dart';


// TODO: 2 ListViews: PAY - SAKLIPAY
class ResultPage extends StatelessWidget {
  ResultPage(
      {
        @required this.calculatedResults,
        @required this.resultText,
      @required this.resultRatesText,});

  final String calculatedResults;
  final String resultText;
  final String resultRatesText;


  @override
  Widget build(BuildContext context) {

    Map<String, double> rates = GlobalState.instance.rates;
    List<String> inheritorsName = rates.keys.toList();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: buildAppBar(),
      body: inheritorsName.length <= 0
          ? Center(
        child: Text("Uygun mirasçı bulunamadığı için, miras devlete kalmıştır."),
      )
          : ListView.builder(
        itemCount: inheritorsName.length,
        itemBuilder: (_, i) => ListTile(
          leading: Icon(Icons.account_circle, color: AppColors.mainColor,),
            trailing: Text(rates[inheritorsName[i]].toString(),
              style: TextStyle(color: Colors.indigo, fontSize: 20),),
          title: Text( inheritorsName[i].toString()+": ",
            style: TextStyle(color: AppColors.mainColor, fontSize: 18, fontWeight: FontWeight.bold, // light
 // italic),),
        )
        ),
    ),
      ),



      /*body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: (<Widget>[

            //Text(GlobalState.instance.answers.toString()),

            //Text(GlobalState.instance.people.toString()),

            Text(calculatedResults.toString()),



            buildAlign(context),
          ]),
        ),
      ),*/
    );
  }

  Align buildAlign(BuildContext context) {
    return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                child: buildElevatedButton(context),
              ),
            ),
          );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Miras Payı Hesaplayıcı - Sonuçlar:"),
      backgroundColor: AppColors.mainColor,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            //Step: 1
            Icons.looks_one,
            color: Colors.white,
          ),
          onPressed: () {
            //maybe toasting "Adım: 1'desiniz" is a good idea.
          },
        )
      ],
    );
  }
}

// Save as png or pdf button, but first let's make listview in this result page
Widget buildElevatedButton(BuildContext context) {
  return ElevatedButton(
    child: Text('KAYDET'),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StartPage()),
      );
    },
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 5),
        primary: Colors.white,
        onPrimary: AppColors.mainColor,
        textStyle: TextStyle(
            color: AppColors.mainColor,
            fontSize: 20,
            fontWeight: FontWeight.bold)),
  );
}
