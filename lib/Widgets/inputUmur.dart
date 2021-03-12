import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class inputUmur extends StatelessWidget {
  const inputUmur({
    Key key,
    @required TextEditingController umurController,
  }) : _umurController = umurController, super(key: key);

  final TextEditingController _umurController;

  @override
  Widget build(BuildContext context) {
    return TextField( //widged texfielde untuk sebuah inputan dari user berupa text
      decoration: InputDecoration(//mengatur tambpilan dibagian input
          labelText: "Umur",//untuk memberi label pada textfield
          hintText: "Masukkan Umur Anda",//hint teks digunakan untuk memberi petunjuk pada textFormFieldnya
          icon: Icon(Icons.person),//memberikan icon pada inputdecoration
          ),
      inputFormatters: [//inputan khusus format digital onlny yaitu 0-9
        FilteringTextInputFormatter.digitsOnly
      ],
      controller: _umurController,//controller digunakan untuk menyimpan inputan umur
      keyboardType: TextInputType.number,//dengan type inputan keyboard nomor
    );
  }
}