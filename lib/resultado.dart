
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  final int pontuacao;
  final void Function() aoReiniciarQuestionario;


  Resultado({this.pontuacao, this.aoReiniciarQuestionario});

  String get fraseResultado {
    if(pontuacao < 8) {
      return 'Beleza, foi legal...';
    } else if (pontuacao < 12) {
      return 'Melhorando...';
    } else if (pontuacao < 16) {
      return 'Show, falta pouco!';
    } else {
      return 'Obrigado, Mestre Jedi!!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
            
          ),
        ),
        TextButton(
          onPressed: aoReiniciarQuestionario,
          child: Text('Reiniciar'),
          )
      ],
      
    );
  }
}