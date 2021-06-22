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
                scrollDirection: Axis.vertical, //.horizontal
                child: Column(
                  children: [
                    buildHeader("Uygulamanın Amacı"),
                    buildText(
                        "Uygulamamız miras paylaşımı noktasında insanlara fikir vermek ve "
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
                    buildText(
                        "Miras bırakan öldüğü sırada yaşayan eşi var ise “Evet” şıkkını seçiniz. "
                        "Miras bırakan evli olmasına rağmen, eşi miras bırakandan önce ölmüş ise “Hayır” şıkkını "
                        "işaretlemeniz gerekir.\n\n"
                        "Eğer boşanmışlar ise, yasal olarak eşi sayılmadığı "
                        "için boşandığı eşine (eğer vasiyetnamede o şekilde bir madde yok"
                        " ise) miras kalmayacaktır. Dolayısıyla yine “Hayır” şıkkını seçiniz.\n\n"
                        "Altsoy ile kastedilen, çocuklar ve onların çocuklarıdır. Evlatlık da çocuk olarak "
                        "sayılmaktadır. Eğer yaşayan bir adet bile altsoy bulunuyor ise lütfen "
                        "“Evet” şıkkını işaretleyiniz."),
                    buildHeader2("Adım 2"),
                    buildImage(context, "assets/images/3.png"),
                    buildText(
                        "Miras bırakanın altsoyu bulunuyor ise, gelecek olan 2. Sayfada miras bırakanın "
                        "tüm çocuklarının sayısını (ölü çocukları da dahil olmak üzere) eklemelisiniz. "
                        "Eğer kolaylık olmasını isterseniz, ölü çocuklar içinden altsoyu olmayan "
                        "(yani hiç çocuğu/torunu vb. olmayan) kişileri bu sayıya dahil etmeyebilirsiniz, "
                        "zira onlara miras kalmayacaktır.\n\n"
                        "Eğer miras bırakanın altsoyu bulunmuyor ise, miras bir sonraki zümre olan üst soya geçmektedir. "
                        "Üstsoydan kasıt miras bırakanın annesi, babası ve onların çocuklarıdır. "
                        "Eğer anne ve babanın ikisi de ölü ise “Hayır” şıkkını işaretleyiniz. Aksi takdirde, "
                        "“Evet” şıkkını seçiniz.\n\n"
                        "Miras bırakanın anne ve babasının çocuğu yahut anne/babasının çocuklarının çocukları "
                        "(örneğin yeğenler) bu kategoriye girmektedir. Yaşayan en az bir adet anne/baba altsoyu bulunuyor "
                        "ise, lütfen “Evet” şıkkını işaretleyiniz. Aksi takdirde “Hayır” şıkkını seçiniz.\n\n"
                        "Eğer ikinci zümrede de yaşayan bir mirasçı adayı bulunmuyor ise, "
                        "miras bir üstsoy olan büyükanne(anneanne, babaanne) ve büyükbaba(anne tarafından dede, "
                        "baba tarafından dede) ve onların altsoylarına geçmektedir. Eğer bu aşamada yaşayan en az "
                        "bir mirasçı bulunuyor ise lütfen ilgili şık için “Evet”i işaretleyiniz."),
                    buildHeader("Kişi Ekleme Formunun Kullanımı"),
                    buildImage(context, "assets/images/4.png"),
                    buildText(
                        "Hangi zümre olduğu fark etmeksizin, mirasçı altsoyu eklerken,"
                        " önce ölmüş olan ebeveynlerinin isimlerini girmeniz beklenmektedir. "
                        "Ardından bu kişinin çocuk sayısını da girerek “Bu kişiyi listeye kaydet” "
                        "yazısına tıklamanız gerekmektedir. Tıkladığınızda butondaki yazı "
                        "“Bu kişi kaydedildi” olarak değişecektir ve sağ üstte bulunan “?” "
                        "işareti tik işaretine dönüşecektir. Bu, kişinin kaydedildiği anlamına gelir.\n\n"
                        "Bu kişi ekleme formlarının sol üstünde “Ebeveyn ismi” olarak yer alan kısımda, "
                        "kişiye miras payı aktaran ölmüş ebeveynin ismi yer almaktadır.\n\n"),
                    buildHeader("Sonuç Sayfası"),
                    buildText("Bu sayfada gerçek ve saklı paylar kişinin isminin yanında yer almaktadır."
                        "Saklı pay miras bırakanın, mirasın üzerinde tasarruf edemeyeceği bölümüdür. Detaylı "
                        "açıklamalar için Miras Hukuku Veri Bankası'nı kontrol edebilirsiniz."),
                    buildImage(context, "assets/images/5.png"),
                    buildHeader2("Önemli not:"),
                    buildText(
                        "İkinci ve üçüncü zümrenin altsoylarına ilişkin şu "
                        "şekilde bir açıklama yapmamız gerekmektedir: \n"
                        "anne ve babanın ikisi de ölmüş ise, ikisinden de ayrı ayrı miras kalacağı "
                        "için aynı kişiyi her iki ebeveyn için ayrı ayrı girmeniz gerekecektir. "
                        "Bu uygulamada çift hısımlık da ele alındığı için kişileri "
                        "anne ve babasına ayrı ayrı eklemek gerekmektedir. "
                        "Yine, anne ve babalarının başkaları ile evlenerek başkalarından "
                        "çocuk sahibi olma ihtimalinden dolayı uygulamanın akışı bu şekilde düzenlenmiştir."
                        "\n\n Bu sebeple, uygulamanın sonuç ekranında aynı kişinin ismi 2 kez yer alacaktır."
                        " Bu kişinin pay oranı, gerçek payların ve saklı paylarının toplamıdır.\n\n"),



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
      actions: <Widget>[],
    );
  }
}

Widget buildHeader(String text) {
  Color headerColor = Colors.black;
  return new Padding(
    padding: const EdgeInsets.all(12.0),
    child: Text(
      text,
      style: new TextStyle(
          fontSize: 25.0, color: headerColor, fontWeight: FontWeight.w600),
    ),
  );
}

Widget buildHeader2(String text) {
  Color headerColor = Colors.black54;
  return new Padding(
    padding: const EdgeInsets.all(12.0),
    child: Text(
      text,
      style: new TextStyle(
          fontSize: 20.0, color: headerColor, fontWeight: FontWeight.w600),
    ),
  );
}

Widget buildText(String text) {
  Color textColor = Colors.black54;
  return new Text(
    text,
    style: new TextStyle(
      fontSize: 16.0,
      color: textColor,
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
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Align(
        alignment: Alignment.center,
        child: Image.asset(path, fit: BoxFit.fitWidth)),
  );
}
