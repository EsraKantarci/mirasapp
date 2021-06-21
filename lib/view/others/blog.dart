//dilekçeler için layout
// download feature will be added: https://www.youtube.com/watch?v=ardrERpmQDA

import 'package:flutter/material.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/view/home_page.dart';
import 'package:miras/view/others/preview.dart';
import 'package:miras/view/start_page.dart';

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:miras/controller/global_state.dart';
import 'package:miras/controller/rank_calculator.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/view/start_page.dart';

class BlogPage extends StatelessWidget {

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

            Expanded(
              flex:1,
              child: buildImage(context),
            ),

            new Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Vasiyetname Hakkında Bilinmesi Gerekenler",
                style: new TextStyle(
                    fontSize: 20.0,
                    color: AppColors.mainColor.withOpacity(0.8),
                    fontWeight: FontWeight.w600),
              ),
            ),

            new Expanded(
              flex: 5,
              child: new SingleChildScrollView(
                scrollDirection: Axis.vertical,//.horizontal
                child: new Text(
                  "Vasiyetname ile sahip olduğu malvarlığı hakkında tasarrufta "
          "bulunmak isteyen kimsenin el yazılı vasiyetname, resmi vasiyetname, "
              "sözlü vasiyetname türlerinden birini tercih etmesi ve Türk Medeni "
              "Kanunu’nda sayılan şartları sağlaması gerekmektedir. \n\n"
          "El yazılı vasiyetnamenin şartlarını yerine getirmek daha basit"
              "olsa da bu tür vasiyetnameyi bulan ve kendi aleyhine bazı"
          "tasarrufların varlığını gören bir kişi ya da mirasçı vasiyetnameyi "
          "kolaylıkla yok edebilir.\n\n"
          "Bu nedenle ispat bakımından kuvvetli delil niteliği "
          "taşıdığından resmi vasiyetname daha çok tercih edilmektedir. "
          "Ayrıca resmi vasiyetnameyi düzenleyen resmi memur, vasiyetnamenin aslını "
          "saklamakla yükümlü olduğundan vasiyetnamenin kolayca ortadan kaldırılması "
              "mümkün değildir.\n\n"

          "Resmi vasiyetnameyi resmi bir memur "
              "(noter veya sulh hakimi) düzenlediğinden vasiyetnamenin kapsamı da "
              "kesinlik ve açıklık kazanmaktadır. Vasiyetçinin son arzularındaki "
          "belirsizlikler resmi memurun soracağı sorularla anlaşılır hale gelmektedir.\n\n"

          "Resmi vasiyetname, miras bırakanın arzularına uygun olarak resmi memur "
          "tarafından yazılabileceği gibi, bizzat vasiyetçi tarafından da yazılmış olabilir. "
          "Bizzat vasiyetçi yazmışsa tasdik ve imza resmi memur tarafından yapılmak zorundadır."
                      "Alıntı: http://www.mirashakki.com/index.php?option=com_content&view=article&id=30:resmi-vasiyetname&catid=13&Itemid=104",
                  style: new TextStyle(
                    fontSize: 16.0, color: AppColors.mainColor.withOpacity(0.7),
                  ),
                ),
              ),
            ),


            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  child: buildElevatedButton(context),
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
      title: Text("Vasiyetname"),
      backgroundColor: AppColors.mainColor,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            //Step: 1
            Icons.lightbulb_outline,
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


    child: Text('Örneği İndir'),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Preview()),
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



Widget buildImage(BuildContext context) {
  return   Padding(
    padding: const EdgeInsets.only(bottom: 5 ),
    child: Align(
      alignment: Alignment.center,
      child:
      Image.asset("assets/images/vasiyet_icon.png", fit: BoxFit.fitWidth)),

  );
}
