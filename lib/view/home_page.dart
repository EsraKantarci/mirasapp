import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:miras/controller/global_state.dart';
import 'package:miras/model/constants/constants.dart';
import 'package:miras/model/person.dart';
import 'package:miras/view/disclaimer_page.dart';
import 'package:miras/view/others/blog.dart';
import 'package:miras/view/others/blog_list.dart';
import 'package:miras/view/contact_page.dart';
import 'package:miras/view/others/dynamic_list.dart';
import 'package:miras/view/guide_page.dart';
import 'package:miras/view/result/test_info.dart';
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
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
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
            buildBlogShowcase(context),
          ],
        ),
      ),
    );
  }

  Container buildBlogShowcase(BuildContext context) {
    return Container(
      // Blog showcase part, will be interactive
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Miras Hukuku Bilgi Bankası",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          buildScrollable(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Uygulamaya Yönelik İçerikler",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          buildManual(context),
          SizedBox(height: 10),
          buildKnowledgeBase(context),
          SizedBox(height: 10),
          buildWhoAreWe(context),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  GestureDetector buildManual(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            //Blog layout will be prepared
            builder: (_) => GuidePage(),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.10,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1, 1),
              spreadRadius: 1,
              blurRadius: 1,
            )
          ],
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/mid.png"),
            RichText(
              text: TextSpan(
                text: "Kullanım Kılavuzu\n",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "Uygulama nasıl kullanılır?\n",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: "Hesaplama önerileri",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }

  GestureDetector buildKnowledgeBase(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            //Blog layout will be prepared
            builder: (_) => BlogList(),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.10,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1, 1),
              spreadRadius: 1,
              blurRadius: 1,
            )
          ],
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/mid.png"),
            RichText(
              text: TextSpan(
                text: "Gelecek Sayfalar\n",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "Arama özellikleri ve veri bankası\n",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: "Blog yerine geçecektir",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }

  GestureDetector buildWhoAreWe(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            //Blog layout will be prepared
            builder: (_) => ContactPage(),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.10,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1, 1),
              spreadRadius: 1,
              blurRadius: 1,
            )
          ],
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/mid.png"),
            RichText(
              text: TextSpan(
                text: "Bize Ulaşın\n",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "Geliştirici kimdir? \n",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: "Geliştirici iletişim bilgileri",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }

  Container buildScrollable() {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlogPage(),
              ),
            );
          },
          child: Container(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 30),
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                buildItem("assets/images/mid.png", "Vasiyetname"),
                buildItem("assets/images/mid.png", "Reddi Miras"),
                buildItem("assets/images/mid.png", "Miras Davası"),
                buildItem("assets/images/mid.png", "Feragatname"),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Column buildHeaderDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeader(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("Miras Payı Hesaplayıcı",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 36,
              )),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("Detaylar:",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
              // Feedback
              "KVKK'ya uygun olarak, uygulamada alınan bilgilerin hiçbiri tarafımızda saklanmamaktadır. "
              "Kullanım konusunda sorun yaşıyor iseniz, aşağıda yer alan Kullanım Kılavuzumuzu okumanızı"
              " tavsiye ederiz.",
              style: TextStyle(
                color: Colors.white,
              )),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        //Instead of raised button, we use elevated one
        //It is newer.
        Padding(
          padding: const EdgeInsets.all(10.0),
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
            onPressed: () {
              clearForms();
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
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        )
        // will add if necessary
      ],
    );
  }

  // Resource: https://github.com/robbyrahmana/app_covid19/
  Widget buildItem(String path, String text) {
    return Column(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: [
                AppColors.backgroundColor,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 3,
              )
            ],
          ),
          padding: EdgeInsets.only(top: 15),
          child: Image.asset(path),
          margin: EdgeInsets.only(right: 20),
        ),
        SizedBox(height: 7),
        Text(
          text,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
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
