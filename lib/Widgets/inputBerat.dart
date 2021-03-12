import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class inputBerat extends StatelessWidget {
  const inputBerat({
    Key key,
    @required TextEditingController beratController,
  }) : _beratController = beratController, super(key: key);

  final TextEditingController _beratController;

  @override
  Widget build(BuildContext context) {
    return TextField(//widged texfielde untuk sebuah inputan dari user berupa text
      decoration: InputDecoration(//mengatur tambpilan dibagian input
          hintText: "Masukkan Berat Badan Anda (Kg)",//hint teks digunakan untuk memberi petunjuk pada textFormFieldnya
          labelText: "Berat Badan",//untuk memberi label pada textfield
          icon: Icon(Icons.storage),//untuk memberi icon
          ),
      inputFormatters: [//inputan khusus format digital onlny yaitu 0-9
        FilteringTextInputFormatter.digitsOnly
      ],
      controller: _beratController,//controller digunakan untuk menyimpan inputan berat
      keyboardType: TextInputType.number,//dengan type inputan keyboard nomor
    );
  }
}