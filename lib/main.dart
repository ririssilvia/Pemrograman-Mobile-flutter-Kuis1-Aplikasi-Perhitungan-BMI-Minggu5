import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //controller
  final TextEditingController _jkController = new TextEditingController();
  final TextEditingController _umurController = new TextEditingController();
  final TextEditingController _tinggiController = new TextEditingController();
  final TextEditingController _beratController = new TextEditingController();

  //variabel berubah
  double _tinggi = 0.0;
  double _berat = 0.0;
  double _rumushasilBMI = 0.0;
  int _finalBMI = 0;
  String _result;

  //Fungsi perhitungan suhu perlu untuk diubah sehingga hanya memproses konversi sesuai
  //dengan pilihan pengguna.
  void _perhitunganBmi() {
     _berat = double.parse(_beratController.text);
      _tinggi = double.parse(_tinggiController.text);
     
    setState(() {
       _rumushasilBMI = _berat / (_tinggi * _tinggi);
      _finalBMI = _rumushasilBMI.round();
     

      if (_finalBMI <= 18) {
        _result = "Anda kekurangan berat badan";
      } else if (_finalBMI > 18 && _finalBMI <= 25) {
        _result = "Anda sempurna";
      } else if (_finalBMI > 25 && _finalBMI <= 30) {
        _result = "Anda kelebihan berat badan";
      } else if (_finalBMI > 30) {
        _result = "Anda obesitas";
      }
    });
  }
  // void _tampilkanalert() {
  //   AlertDialog alertDialog = new AlertDialog(
  //     content: new Container(
  //       height: 200.0,
  //       child:  Center(
  //         child:  Text(
  //           " Hasil BMI Anda  is $_finalBMI : $_result"),
  //       ),
  //     ),
  //     actions: [
  //       // ignore: deprecated_member_use
  //       FlatButton(
  //         child: Text('Tutup'),
  //         onPressed: () {
  //           Navigator.of(context).pop();
  //         },
  //       ),
  //     ],
  //   );
  //   //showDialog(context: context, child: alertDialog, barrierDismissible: false,);
  // }

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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Container(
              //       margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              //       child: CupertinoButton(
              //         child: Text("Laki-Laki",
              //             style: TextStyle(color: Colors.black)),
              //         onPressed: () {},
              //       ),
              //     ),
              //     Container(
              //       margin: EdgeInsets.fromLTRB(10, 10, 20, 0),
              //       child: CupertinoButton(
              //         child: Text("Perempuan",
              //             style: TextStyle(color: Colors.black)),
              //         onPressed: () {},
              //       ),
              //     ),
              //   ],
              // ),
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
                height: 400.0,
                width: 100.0,
                margin: EdgeInsets.all(10.10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              labelText: "Jenis Kelamain",
                              hintText: "Masukkan Jenis Kelamin Anda",
                              icon: Icon(Icons.person_search_rounded)),
                          controller: _jkController,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: "Umur",
                              hintText: "Masukkan Umur Anda",
                              icon: Icon(Icons.person)),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: _umurController,
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Masukkan Tinggi Anda (m)",
                              labelText: "Tinggi",
                              icon: new Icon(Icons.assessment)),
                         
                          controller: _tinggiController,
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
                          controller: _beratController,
                          keyboardType: TextInputType.number,
                        ),
                        // Container(
                        //   padding: EdgeInsets.all(10.0),
                        //   child: Center(
                        //     child: RaisedButton(
                        //       child: Text(
                        //         "Kalkulasi",
                        //         style: TextStyle(color: Colors.white),
                        //       ),
                        //       color: Colors.blue,
                        //       onPressed: () {
                        //        _tampilkanalert();
                        //       },
                        //     ),
                        //   ),
                        // ),
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                          onPressed: _perhitunganBmi,
                          color: Colors.teal,
                          child: Text(
                            "Calculate",
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.9),
                          ),
                             ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Center(
                            child: Text
                            ("BMI Anda Adalah $_finalBMI : $_result",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500
                            ),
                            ),
                            ),
                          )
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

 
