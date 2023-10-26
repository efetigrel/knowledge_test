import 'package:bilgi_testi/constants.dart';
import 'package:bilgi_testi/test-veri.dart';
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

  TestVeri test_1 = TestVeri();

  void butonFonksiyonu(bool secilenButon) {
    if (test_1.testBittiMi() == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Bravo Testi Bitirdiniz"),
            // content: new Text("Alert Dialog body"),
            actions: <Widget>[
              ElevatedButton(
                child: const Text("Başa Dön"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(
                    () {
                      test_1.testiSifirla();
                      secimler = [];
                    },
                  );
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(
        () {
          test_1.getSoruYaniti() == secilenButon
              ? secimler.add(kDogruIconu)
              : secimler.add(kYanlisIconu);
          test_1.sonrakiSoru();
        },
      );
    }
  }

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
                test_1.getSoruMetni(),
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
                        butonFonksiyonu(false);
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
                        butonFonksiyonu(true);
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
