//dilekçeler için layout
// download feature will be added: https://www.youtube.com/watch?v=ardrERpmQDA


import 'package:flutter/material.dart';
import 'package:miras/model/constants/constants.dart';
import 'package:miras/view/home_page.dart';
import 'package:miras/view/start_page.dart';

import 'package:flutter/material.dart';
import 'package:miras/controller/global_state.dart';
import 'package:miras/controller/rank_calculator.dart';
import 'package:miras/model/constants/constants.dart';
import 'package:miras/view/start_page.dart';

class GuidePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: (<Widget>[

            new Expanded(
              flex: 2,
              child: new SingleChildScrollView(
                scrollDirection: Axis.vertical,//.horizontal
                child: Column(
                  children: [
                    buildHeader("Uygulamanın Amacı"),
                    buildText("Uygulamamız miras paylaşımı noktasında insanlara fikir vermek ve "
                        "miras hukuku konusunda kişileri bilgilendirmektir. Bu uygulamanın "
                        "hesaplama kuralları Türk Medeni Kanunu'nun 495. madde ve devamında"
                        " yer alan kaideler üzerinden geliştirilmiştir. "
                        "\n\n"
                        "Uygulamamız bilgi verme amaçlıdır, hukuki bir bağlayıcılığı bulunmamaktadır."),

                    buildDivider(),

                    buildHeader("Hesaplama Kuralları"),

                    buildHeader2("Adım 1"),
                    buildImage(context, "assets/images/1.png"),
                    buildText("Öncelikle miras bırakan kişinin ismini giriniz. "
                          "Bu sonraki sayfalarda size kolaylık sağlayacaktır. Merak etmeyin, "
                          "girdiğiniz hiçbir veri tarafımızda saklanmamaktadır. Uygulama hesaplama"
                          " ekranından çıktığınızda girdiğiniz bütün veriler silinmektedir.\n\n"),
                    buildImage(context, "assets/images/2.png"),
                    buildText(""),
                  ],
                ),
              ),
            ),

          ]),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Kullanım Kılavuzu"),
      backgroundColor: AppColors.mainColor,
      actions: <Widget>[
      ],
    );
  }
}

Widget buildHeader(String text){
  Color headerColor = Colors.black;
  return new Padding(
    padding: const EdgeInsets.all(12.0),
    child: Text(
      text,
      style: new TextStyle(
          fontSize: 25.0,
          color: headerColor,
          fontWeight: FontWeight.w600),
    ),
  );
}

Widget buildHeader2(String text){
  Color headerColor = Colors.black54;
  return new Padding(
    padding: const EdgeInsets.all(12.0),
    child: Text(
      text,
      style: new TextStyle(
          fontSize: 20.0,
          color: headerColor,
          fontWeight: FontWeight.w600),
    ),
  );
}

Widget buildText(String text){
  Color textColor = Colors.black54;
  return new Text(text,
    style: new TextStyle(
      fontSize: 16.0, color: textColor,
    ),
  );
}

Padding buildDivider() {
 return Padding(
    padding: const EdgeInsets.all(20),
    child: const Divider(
      height: 20,
      thickness: 5,
      indent: 20,
      endIndent: 20,
    ),
  );
}

Widget buildImage(BuildContext context, String path) {
  return   Padding(
    padding: const EdgeInsets.all(20),
    child: Align(
        alignment: Alignment.center,
        child:
        Image.asset(path, fit: BoxFit.fitWidth)),

  );
}
