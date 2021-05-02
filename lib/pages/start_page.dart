import 'package:flutter/material.dart';
import 'package:miras/constants.dart';
import 'package:miras/my_flutter_app_icons.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
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
            child: Column(
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
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton() {
    return Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text('HESAPLAMAYA BAŞLA'),
                        onPressed: () {},
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

  Row buildHeader() {
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
