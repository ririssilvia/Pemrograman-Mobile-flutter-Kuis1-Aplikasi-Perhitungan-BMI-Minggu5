import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class inputTinggi extends StatelessWidget {
  const inputTinggi({
    Key key,
    @required TextEditingController tinggiController,
  }) : _tinggiController = tinggiController, super(key: key);

  final TextEditingController _tinggiController;

  @override
  Widget build(BuildContext context) {
    return TextField(//widged texfielde untuk sebuah inputan dari user berupa text
      decoration: InputDecoration(//mengatur tambpilan dibagian input
          hintText: "Masukkan Tinggi Anda (m)",//hint teks digunakan untuk memberi petunjuk pada textFormFieldnya
          labelText: "Tinggi",//untuk memberi label pada textfield
          icon: new Icon(Icons.assessment), //memberikan icon 
          ),
      controller: _tinggiController,//controller digunakan untuk menyimpan inputan tinggi
      keyboardType: TextInputType.number,//dengan type inputan keyboard nomor
    );
  }
}