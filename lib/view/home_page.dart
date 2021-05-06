import 'package:flutter/material.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/model/my_flutter_app_icons.dart';
import 'package:miras/view/form_page.dart';
import 'package:miras/view/start_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              children: [
                //Background decoration:
                //Image.asset("assets/images/logo.png"),
                buildHeaderDetails(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                RichText(text: TextSpan(
                  text: "Yine bir takım yazılar, buraya blog eklenecek. Şimdilik form kısmına geçebiliriz.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black38,
                  ),
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildHeaderDetails() {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("Miras Paylaşımı Uygulaması",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    )),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("Detaylar bir şey iki şey",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                    "Yine bir sürü detaylar lorem ipsumlar birler ikiler çalışkan üçler bakalım bunu ne kadar uzun uzadıya devam ettirebiliyoruz çünkü ettirebiliriz galiba.",
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              SizedBox(height: 25),
              //Instead of raised button, we use elevated one
              //It is newer.
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: buildButton(),
              ),
            ],
          );
  }

  Widget buildButton() {
    return Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text('HESAPLAMAYA BAŞLA'),
                        onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StartPage()),
                        );},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            primary: Colors.white,
                            onPrimary: AppColors.mainColor,
                            textStyle: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                );
  }

  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.account_circle, color: Colors.white),
          onPressed: null,
        ),
      ],
    );
  }
}
