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
                    new Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Uygulamanın Amacı",
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: AppColors.mainColor.withOpacity(0.8),
                            fontWeight: FontWeight.w600),
                      ),
                    ),


                    new Text(
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
                          "mümkün değildir.\n\n",
                      style: new TextStyle(
                        fontSize: 16.0, color: AppColors.mainColor.withOpacity(0.7),
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Uygulamanın Amacı",
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: AppColors.mainColor.withOpacity(0.8),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    new Text(
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
                          "Bizzat vasiyetçi yazmışsa tasdik ve imza resmi memur tarafından yapılmak zorundadır.",
                      style: new TextStyle(
                        fontSize: 16.0, color: AppColors.mainColor.withOpacity(0.7),
                      ),
                    ),
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

Widget buildImage(BuildContext context) {
  return   Padding(
    padding: const EdgeInsets.only(bottom: 5 ),
    child: Align(
        alignment: Alignment.center,
        child:
        Image.asset("assets/images/vasiyet.png", fit: BoxFit.fitWidth)),

  );
}
