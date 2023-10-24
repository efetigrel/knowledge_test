import 'dart:ffi';

import 'package:bilgi_testi/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  List<String> sorular = [
    'Titanic gelmiş geçmiş en büyük gemidir', //false
    'Dünyadaki tavuk sayısı insan sayısından fazladır', //true
    'Kelebeklerin ömrü bir gündür', //false
    'Dünya düzdür', //false
    'Kaju fıstığı aslında bir meyvenin sapıdır', //true
    'Fatih Sultan Mehmet hiç patates yememiştir', //true
    'Fransızlar 80 demek için, 4 - 20 der' //true
  ];
  List<bool> yanitlar = [
    false, //false
    true, //true
    false, //false
    false, //false
    true, //true
    true, //true
    true //true
  ];

  int soruIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                sorular[soruIndex],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 3,
          runSpacing: 3,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[400]),
                      onPressed: () {
                        bool yanlisYanit = yanitlar[soruIndex];
                        setState(() {
                          yanlisYanit == true
                              ? secimler.add(kYanlisIconu)
                              : secimler.add(kDogruIconu);
                          // if (yanlisYanit == true) {
                          //   secimler.add(kYanlisIconu);
                          // } else {
                          //   secimler.add(kDogruIconu);
                          // }

                          // secimler.add(kYanlisIconu);
                          soruIndex++;
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Icon(Icons.thumb_down,
                            size: 30.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[400],
                      ),
                      onPressed: () {
                        bool dogruYanit = yanitlar[soruIndex];
                        setState(() {
                          dogruYanit == true
                              ? secimler.add(kDogruIconu)
                              : secimler.add(kYanlisIconu);
                          //secimler.add(kDogruIconu);
                          soruIndex++;
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.thumb_up,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
