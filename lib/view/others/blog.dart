//dilekçeler için layout
// download feature will be added: https://www.youtube.com/watch?v=ardrERpmQDA


import 'package:flutter/material.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/view/home_page.dart';
import 'package:miras/view/start_page.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // in order not to use constants like pixels,
        // we decided to use MediaQuery for responsiveness.
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.mainColor.withOpacity(0.5),
              AppColors.backgroundColor
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Vasiyetname Örneği",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
           buildImage(context),
            Positioned(
              bottom: 50,
              child: buildBottom(context),
            ),
          ],
        ),
      ),
    );
  }
}

// Adding bottom container here for readability
Widget buildBottom(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => HomePage(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 3,
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            //bunu direkt pixel olarak versek daha iyi oluyor ama
            //biraz kontrol edelim şimdilik responsiveness için
            height: MediaQuery.of(context).size.height * 0.05,
            child: Center(
                child: Text("DİLEKÇEYİ İNDİR",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ))),
          ),
        ),
      ],
    ),
  );
}


Widget buildImage(BuildContext context) {
  return   Padding(
    padding: const EdgeInsets.only(bottom: 100),
    child: Align(
      alignment: Alignment.center,
      child:
      Image.asset("assets/images/vasiyet.png", fit: BoxFit.fitWidth)),

  );
}
