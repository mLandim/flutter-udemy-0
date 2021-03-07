import 'package:flutter/material.dart';
import './questao.dart';


class Questionario extends StatelessWidget {

  final String pergunta;
  final List<Widget> respostas;

  Questionario({@required this.pergunta, @required this.respostas});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Questao(pergunta),
        ...respostas,

      ],
      
    );
  }
}