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
                      "Uygulamamız miras paylaşımı noktasında insanlara fikir vermek ve "
                          "miras hukuku konusunda kişileri bilgilendirmektir. Bu uygulamanın "
                          "hesaplama kuralları Türk Medeni Kanunu'nun 495. madde ve devamında"
                          " yer alan kaideler üzerinden geliştirilmiştir. "
                          "\n\n"
                          "Uygulamamız bilgi verme amaçlıdır, hukuki bir bağlayıcılığı bulunmamaktadır.",
                      style: new TextStyle(
                        fontSize: 16.0, color: AppColors.mainColor.withOpacity(0.7),
                      ),
                    ),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Align(
                          alignment: Alignment.center,
                          child:
                          Image.asset("assets/images/independence.png", fit: BoxFit.fitWidth),
                        ),
                      ),

                    new Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Hesaplama Kuralları",
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: AppColors.mainColor.withOpacity(0.8),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    new Text(
                      "Öncelikle miras bırakan kişinin ismini giriniz. "
                          "Bu sonraki sayfalarda size kolaylık sağlayacaktır. Merak etmeyin, "
                          "girdiğiniz hiçbir veri tarafımızda saklanmamaktadır. Uygulama hesaplama"
                          " ekranından çıktığınızda girdiğiniz bütün veriler silinmektedir.\n\n",
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
