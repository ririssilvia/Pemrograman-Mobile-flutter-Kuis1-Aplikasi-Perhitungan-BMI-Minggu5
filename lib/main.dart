import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
  //controller
  final TextEditingController _umurController = new TextEditingController();
  final TextEditingController _tinggiController = new TextEditingController();
  final TextEditingController _beratController = new TextEditingController();

//variabel berubah
  double _tinggi = 0.0;
  double _berat = 0.0;
  double _rumusbmi = 0.0;
  int _finalBMI = 0;
  String _result;

//Fungsi perhitungan suhu perlu untuk diubah sehingga hanya memproses konversi sesuai
  Void _perhitunganBMI(){

  }
}



class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kuis 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text("BMI Calculator"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Container(
          //alignment: Alignment.topCenter,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: CupertinoButton(
                      child: Text("Laki-Laki",
                          style: TextStyle(color: Colors.black)),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 20, 0),
                    child: CupertinoButton(
                      child: Text("Perempuan",
                          style: TextStyle(color: Colors.black)),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Image(
                    image: NetworkImage(
                        "https://tap-assets-prod.dexecure.net/wp-content/uploads/sites/24/2020/09/BMI.jpg"),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 5.0),
                ),
                height: 300.0,
                width: 100.0,
                margin: EdgeInsets.all(10.10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              labelText: "Umur",
                              hintText: "Masukkan Umur Anda",
                              icon: Icon(Icons.person)),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          //controller: etInput,
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Masukkan Tinggi Anda (cm)",
                              labelText: "Tinggi",
                              icon: new Icon(Icons.assessment)),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          //controller: etInput,
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Masukkan Berat Badan Anda (Kg)",
                              labelText: "Berat Badan",
                              icon: Icon(Icons.storage)),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          //controller: etInput,
                          keyboardType: TextInputType.number,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          child: RaisedButton(
                            elevation: 5.0,
                            color: Colors.red,
                            child: Text("Hasil"),
                            onPressed: () {
                              showAlertDialog(context);
                            },
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
// set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {},
  );
// set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("My title"),
    content: Text("This is my message."),
    actions: [
      okButton,
    ],
  );
// show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
