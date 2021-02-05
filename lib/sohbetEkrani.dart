import 'package:flutter/material.dart';

class MesajEkrani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(isim),
            ),
          ],
        ),
        backgroundColor: Color(0XFF075e54),
        actions: [
          IconButton(
            color: Colors.grey,
            icon: Icon(Icons.video_call),
            onPressed: () {},
          ),
          IconButton(
            color: Colors.grey,
            icon: Icon(Icons.phone),
            onPressed: () {},
          ),
          GestureDetector(onTap: () {}, child: Icon(Icons.more_vert)),
        ],
      ),
      body: SohbetEkrani(),
    );
  }
}

class SohbetEkrani extends StatefulWidget {
  @override
  _SohbetEkraniState createState() => _SohbetEkraniState();
}

class _SohbetEkraniState extends State<SohbetEkrani> {
  TextEditingController t1 = TextEditingController();
  List<MesajBalonu> mesajListesi = [];
  listeyeEkle(String gelenMesaj) {
    setState(() {
      MesajBalonu mesajNesnesi = MesajBalonu(mesaj: gelenMesaj);
      mesajListesi.insert(0, mesajNesnesi);
      t1.clear();
    });
  }

  Widget metinGirisAlani() {
    return Container(
      margin: const EdgeInsets.only(bottom: 7.5, left: 7.5),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                  borderRadius: const BorderRadius.all(
                    const Radius.elliptical(40, 40),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                  borderRadius: const BorderRadius.all(
                    const Radius.elliptical(40, 40),
                  ),
                ),
                prefixIcon: IconButton(
                  color: Colors.grey,
                  icon: Icon(Icons.emoji_emotions),
                  onPressed: () {},
                ),
                suffixIcon: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // added line
                  mainAxisSize: MainAxisSize.min, // added line
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.attach_file),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.camera_enhance),
                      onPressed: () {},
                    ),
                  ],
                ),
                hintText: "Bir Mesaj Yazın",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.black,
                hoverColor: Colors.black,
              ),
              controller: t1,
            ),
          ),
          IconButton(
            color: Color(0XFF075e54),
            icon: Icon(Icons.send),
            onPressed: () => listeyeEkle(t1.text),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('asset/images/background.png'), fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: mesajListesi.length,
              itemBuilder: (_, indexNumarasi) => Align(
                child: mesajListesi[indexNumarasi],
                alignment: Alignment.centerRight,
              ),
            ),
          ),
          Divider(
            thickness: 1.5,
          ),
          metinGirisAlani(),
        ],
      ),
    );
  }
}

String isim = "Oğuzhan";

// ignore: must_be_immutable
class MesajBalonu extends StatelessWidget {
  String mesaj;
  MesajBalonu({this.mesaj});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
            topRight: const Radius.elliptical(10, 10),
            bottomRight: const Radius.elliptical(10, 10),
            bottomLeft: const Radius.elliptical(10, 10)),
      ),
      margin: const EdgeInsets.only(bottom: 7.5, left: 7.5, right: 150),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Color(0XFF075e54),
            child: Text(isim[0]),
          ),
          Column(
            children: [
              Text(
                isim,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                mesaj,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(),
    borderRadius: BorderRadius.all(
        Radius.circular(5.0) //                 <--- border radius here
        ),
  );
}
