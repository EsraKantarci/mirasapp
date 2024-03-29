import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miras/controller/global_state.dart';
import 'package:miras/controller/rank_calculator.dart';
import 'package:miras/model/constants/constants.dart';
import 'package:miras/view/home_page.dart';
import 'package:miras/view/start_page.dart';

// TODO: 2 ListViews: PAY - SAKLIPAY
class ResultPage extends StatelessWidget {
  ResultPage({
    @required this.calculatedResults,
    @required this.resultText,
    @required this.resultRatesText,
  });

  final String calculatedResults;
  final String resultText;
  final String resultRatesText;

  @override
  Widget build(BuildContext context) {
    Map<String, double> rates = GlobalState.instance.rates;
    Map<String, double> hiddenRates = GlobalState.instance.hiddenRates;
    List<String> inheritorsName = rates.keys.toList();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: buildAppBar(),
      body: inheritorsName.length <= 0
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: (<Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                          "\n\nUygun mirasçı bulunamadığı için, miras devlete kalmıştır.",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 25,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/independence.png",
                            fit: BoxFit.fitWidth),
                      ),
                    ),
                  ),
                ]),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: inheritorsName.length,
                itemBuilder: (_, i) {
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: AppColors.mainColor,
                      ),
                      trailing: Text(
                        "Gerçek Pay: " +
                            rates[inheritorsName[i]].toString() +
                            "\n Saklı Pay: " +
                            hiddenRates[inheritorsName[i]].toString(),
                        style: TextStyle(color: Colors.indigo, fontSize: 15),
                      ),
                      title: Text(inheritorsName[i].toString() + ": ",
                          style: TextStyle(
                            color: AppColors.mainColor, fontSize: 18,
                            fontWeight: FontWeight.bold, // light
                            // italic),),
                          )),
                    ),
                  );
                },
              ),
            ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton(
              child: Text(
                "YENİDEN HESAPLA",
                style: TextStyle(
                    color: AppColors.mainColor, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                print(GlobalState.instance.people.toString());
                clearForms();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StartPage()),
                );
              },
            ),
            SizedBox(width: 48.0),
            TextButton(
              child: Text("ANASAYFAYA DÖN",
                  style: TextStyle(
                      color: AppColors.mainColor, fontWeight: FontWeight.bold)),
              onPressed: () {
                clearForms();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        child: Icon(Icons.save),
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Bilgi Penceresi:'),
              content: const Text(
                  'Henüz telefona kaydetme özelliği uygulamamıza eklenmedi.  Ancak isterseniz ekran görüntüsü alabilirsiniz. İlginiz için teşekkür ederiz.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Anladım'),
                  child: const Text(
                    'Anladım',
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Align buildAlign(BuildContext context, text) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width,
          child: buildElevatedButton(context, text),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Miras Oranları Listesi"),
      backgroundColor: AppColors.mainColor,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            //Step: 1
            Icons.done_all,
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
Widget buildElevatedButton(BuildContext context, String text) {
  return ElevatedButton(
    child: Text(text),
    onPressed: () {
      var route;
      if (text == "KAYDET") {
        route = StartPage();
      } else {
        route = HomePage();
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => route),
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

void clearForms() {
  GlobalState.instance.answers.childCount = 0;
  GlobalState.instance.children
      .removeRange(0, GlobalState.instance.children.length);
  print("çocuklar: " + GlobalState.instance.children.toString());
  GlobalState.instance.people
      .removeRange(0, GlobalState.instance.people.length);
  print("kişiler: " + GlobalState.instance.people.toString());
  GlobalState.instance.idMatch
      .removeRange(0, GlobalState.instance.idMatch.length);
  print("idmatch: " + GlobalState.instance.children.toString());
  GlobalState.instance.deadsWithChildren.clear();
  print("deads with children: " +
      GlobalState.instance.deadsWithChildren.toString());
  GlobalState.instance.deads.clear();
  print("deads: " + GlobalState.instance.deads.toString());
  GlobalState.instance.rates.clear();
  print("rates: " + GlobalState.instance.rates.toString());
  GlobalState.instance.hiddenRates.clear();
  print("hiddenrates: " + GlobalState.instance.deads.toString());
  GlobalState.instance.parentalInfo
      .removeRange(0, GlobalState.instance.hiddenRates.length);
  print("temizlendi----");
}
