import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Widgets/inputBerat.dart';
import 'Widgets/inputJk.dart';
import 'Widgets/inputTinggi.dart';
import 'Widgets/inputUmur.dart';

void main() {
  runApp(MyApp());
}

//menggunakan stateful widget akan terjadi perubahan saat fungsi set state dieksekusi/dinamis datanya
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  //membuat controller untuk mengisikan  form/textfield yang dapat diedit/diisi
  final TextEditingController _jkController = new TextEditingController();
  final TextEditingController _umurController = new TextEditingController();
  final TextEditingController _tinggiController = new TextEditingController();
  final TextEditingController _beratController = new TextEditingController();

  //deklarasi variabel yang bisa berubah nilainya
  double _tinggi = 0.0;
  double _berat = 0.0;
  double _rumushasilBMI = 0.0;
  int _finalBMI = 0;
  String _result;

  
  void _perhitunganBmi() { //fungsi untuk menghitung BMI
    _berat = double.parse(_beratController.text);//mengisi variabel berat sesuai niali yang di tampung pada Controller
    _tinggi = double.parse(_tinggiController.text);////mengisi variabel tinggi sesuai niali yang di tampung pada Controller
     //berat dan tinggi ada di luar setstate karena ditampilakan di ui jika yang di dalam setstate tidak ditampilkan kedalam ui
    setState(() { //fungsi akan di panggil setiap ada perubahan
       _rumushasilBMI = _berat / (_tinggi * _tinggi);//rumus perhitungan BMI
      _finalBMI = _rumushasilBMI.round();//hasil dari perhitungan BMI yang di bulatkan
     

      if (_finalBMI <= 18) {//kondisi jika finalbmi bernilai <=18 
        _result = "Anda kekurangan berat badan"; //maka akan di tampilkan kondisi seperti ini
      } else if (_finalBMI > 18 && _finalBMI <= 25) {//jika kondisi yang pertama tidak terpenuhi maka akan turun ke kondisi selanjutnya dengan nilai lebih dari 18 sampai dengan kurang samandenagn25
        _result = "Anda sempurna";//maka akan di tampilkan kondisi seperti ini
      } else if (_finalBMI > 25 && _finalBMI <= 30) { //jika kondisi keduanya tadi tidak terpenuhi maka akan meng eksukusi kondisi ini dengan nilai _finalBMI > 25 && _finalBMI <= 30
        _result = "Anda kelebihan berat badan";//maka akan di tampilkan kondisi seperti ini
      } else if (_finalBMI > 30) {//jika kondisi ketiganya tidak terpenuhi maka akan mengesekusi kondisi ini dengan nilai final bmi lebih dari 30
        _result = "Anda obesitas";//maka akan di tampilkan kondisi seperti ini
      }
    });
  }

  @override
  Widget build(BuildContext context) {//widget yang dijalankan saat dibuild
    // titik awal aplikasi  ini memberi tahu Flutter bahwa akan menggunakan komponen Material dan mengikuti desain material di aplikasi .
    return MaterialApp(
      debugShowCheckedModeBanner: false,//untuk menghilangkan debug di sebelah pojok kanan atas
      title: 'Kuis 1',//judul untuk aplikasi 
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,//mengatur tampilan agar sesuai dengan platform yang dirun
      ),
      //Scaffolddigunakan di bawah MaterialApp, memberikan Anda banyak fungsi dasar, seperti AppBar, BottomNavigationBar, Drawer, FloatingActionButtondll
      home: Scaffold(
        appBar: AppBar(//menagtur bagian atas aplikasi
          leading: Icon(Icons.home),//memberikan icon home
          title: Text("BMI Calculator"),//memeberi judul di bagian atas aplikasi
          backgroundColor: Colors.blue,//memberikan warna biru untuk aplikasi bagaian atas atau appbar 
          centerTitle: true,//dengan judul di tengah
        ),
        body: Container(//membuat pengaturan untuk bagian utama halaman yaitu body
          child: ListView(//untuk membiat layout berbentuk listviw
            children: [
              Container(
                child: Padding(//untuk memberikan widget child yang ada di dalam dengan memeberikan jarak 
                  padding: EdgeInsets.only(top: 10.0),//mrngatur padding di bagian tertentu yaitu di bagain atas saja
                  child: Image(//chlid dari padding yaitu gambar
                    image: NetworkImage( //untuk mengambil gambar dari internet
                        "https://tap-assets-prod.dexecure.net/wp-content/uploads/sites/24/2020/09/BMI.jpg"),
                  ),
                ),
              ),
              Container(//widget container untuk mengatur  layout child
                decoration: BoxDecoration( //mengatur border
                  border: Border.all(color: Colors.blue, width: 5.0), //mengatur ketebalan border
                ),
                height: 400.0,//mengatur panjang border
                width: 100.0,//mengatur lebar border
                margin: EdgeInsets.all(10.10),//mengatur margin atau batas keseluruhan
                child: Padding(//mengatur padding
                  padding:  EdgeInsets.all(16.0),//mengatur padding atau batas keseluruhan
                  child: Column(//membuat widget chlid column
                      mainAxisAlignment: MainAxisAlignment.center,//membuat column agar di tengah
                      children: [
                        inputJk(jkController: _jkController),
                        inputUmur(umurController: _umurController),
                        inputTinggi(tinggiController: _tinggiController),
                        inputBerat(beratController: _beratController),
                        Container(//widgwd container untuk mengatur button
                          margin:  EdgeInsets.only(top: 20.0),//mengatur margin hanya bagaian atas
                          // ignore: deprecated_member_use
                          child: RaisedButton(//widgwd child button
                          onPressed: _perhitunganBmi,//untuk proses ketika di klik maka fungsi _perhitungan bmi akan di eksekusi
                          color: Colors.teal,//memberikan warna pada button
                          child: Text(//memberikan text pada button dengan nama calculate
                            "Calculate",
                            style: TextStyle(//memberikan text dengan style warna putih dengan besarnya 
                                color: Colors.white, fontSize: 17),
                          ),
                             ),
                        ),
                        Padding(//widget padding
                          padding: EdgeInsets.only(top: 5.0),//mengatur padding kushus bagaian atas
                          child: Center(//membuad chlid di bagain tengah dengan berisikan text
                            child: Text//widget txt
                            ("BMI Anda Adalah $_finalBMI : $_result",//untuk menampilkan berupa hasil final dan result di dalam kondisi
                            style: TextStyle(//memeberikan style dengan warna biru dengan font 18 dan di bold
                              color: Colors.blueAccent,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
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









 
