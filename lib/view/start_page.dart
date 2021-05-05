import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/view/home_page.dart';

// https://www.youtube.com/watch?v=mLAY8sp-IoE
// https://www.youtube.com/watch?v=H2pVgDjDrxQ
class StartPage extends StatefulWidget {
  const StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  // For radio buttons:
  int hasSpouse;
  int spouseGroupValue;

  int hasChildren;
  int childrenGroupValue;

  @override
  void initState(){
    super.initState();
    spouseGroupValue =  0;
    childrenGroupValue = 0;
  }

  setSelectedRadio(int val, int groupValue){
    setState(() {
      groupValue = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.only(top: 25),
            child: Stack(
              children: <Widget>[
                //Background decoration:
                //Image.asset("assets/images/logo.png"),
                buildHeaderDetails(),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Miras bırakanın ismi:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: TextField(
                      onChanged: (text) {},
                      decoration: InputDecoration(
                        hintText: "Miras bırakanın ismini giriniz...",
                        hintStyle: TextStyle(fontWeight: FontWeight.normal),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Miras bırakan evli miydi?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainColor,
                    ),
                  ),
                  buildHasSpouse(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Miras bırakanın altsoyu (çocuğu/çocukları/torunları vb.) var mıydı?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainColor,
                    ),
                  ),
                  buildHasChildren(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      child: buildElevatedButton(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[],
            ),
          ),
        ],
      ),
    );
  }

  Container buildHasSpouse() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Radio(
                  value: 1,
                  groupValue: spouseGroupValue,
                  onChanged: (val) {
                    hasSpouse = val;
                    setSelectedRadio(val, spouseGroupValue);
                    print("Selam evet");
                  }),
              Text("Evet",
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
            ],
          ),
          Row(
            children: <Widget>[
              Radio(
                  value: 0,
                  groupValue: spouseGroupValue,
                  onChanged: (val) {
                    hasSpouse = val;
                    setSelectedRadio(val, spouseGroupValue);
                    print("Selam hayır");
                  }),
              Text("Hayır",
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
            ],
          ),
        ],
      ),
    );
  }

  Container buildHasChildren() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Radio(value: null, groupValue: null, onChanged: null),
              Text("Evet",
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
            ],
          ),
          Row(
            children: <Widget>[
              Radio(value: null, groupValue: null, onChanged: null),
              Text("Hayır",
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
            ],
          ),
        ],
      ),
    );
  }

  ElevatedButton buildElevatedButton(BuildContext context) {
    return ElevatedButton(
      child: Text('HESAPLAMAYA BAŞLA'),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
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

  Column buildHeaderDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeader(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("Miras Payı Hesaplama",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              )),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(height: 20),
        //Header part will be updated.
      ],
    );
  }
}
