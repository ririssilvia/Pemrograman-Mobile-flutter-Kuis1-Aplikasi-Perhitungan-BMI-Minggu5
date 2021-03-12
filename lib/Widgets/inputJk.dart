import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class inputJk extends StatelessWidget {
  const inputJk({
    Key key,
    @required TextEditingController jkController,
  }) : _jkController = jkController, super(key: key);

  final TextEditingController _jkController;

  @override
  Widget build(BuildContext context) {
    return TextField(//widged texfielde untuk sebuah inputan dari user berupa text
      decoration: InputDecoration(//mengatur tambpilan dibagian input
          labelText: "Jenis Kelamain",//untuk memberi label pada textfield
          hintText: "Masukkan Jenis Kelamin Anda",//hint teks digunakan untuk memberi petunjuk pada textFormFieldnya
          icon: Icon(Icons.person_search_rounded),//memberikan icon pada inputdecoration
          ),
      controller: _jkController,//controller digunakan untuk menyimpan inputan jenis kelamin 
    );
  }
}