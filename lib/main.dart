

import 'package:flutter/material.dart';
import './resposta.dart';
import './questionario.dart';
import './resultado.dart';

main() {
  runApp(PerguntaApp());

}

class _PerguntaAppState extends State<PerguntaApp> {

  final List<Map<String, Object>> _perguntas = const [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': [
          {'texto': 'Preto', 'nota': 10},
          {'texto': 'Vermelho','nota': 7},
          {'texto': 'Verde','nota': 3},
          {'texto': 'Azul','nota': 8},
        ],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': [
          {'texto': 'Cachorro','nota': 10},
          {'texto': 'Gato','nota': 10},
          {'texto': 'Papagaio','nota': 9},
          {'texto': 'Furão','nota': 9},
        ],
      },
      {
        'texto': 'Qual é a sua linguagem favorita?',
        'respostas': [
          {'texto': 'Javascript','nota': 9},
          {'texto': 'Java','nota': 2},
          {'texto': 'Dart','nota': 8},
          {'texto': 'Python','nota': 10},
        ],
      }
  ];

  var _perguntaSelecionada = 0;
  var _scoreTotal = 0;


  void _responder(int pontuacao) {

    if(temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _scoreTotal += pontuacao;
      });
    }
    
    
    print('Pergunta respondida $_perguntaSelecionada');
    print('Score total $_scoreTotal');
    
  }

  // comunicação indireta - passando rferência da função para componente filho onde será chamada
  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _scoreTotal = 0;
    });
  }

  // getter
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }





  @override
  Widget build(BuildContext context) {


    
    List<Map<String,Object>> respostas = temPerguntaSelecionada ? _perguntas[_perguntaSelecionada]['respostas'] : null; 
    
    // Forma imperativa de definir de os componentes da tela
    // List<Widget> widgetsResposta = [];
    // for (String respostaTexto in respostas) {
    //   widgetsResposta.add(Resposta(respostaTexto, _responder));
    // }

    // Forma declarativa - usando método map (abordagem mais funcional)
    List<Widget> widgetsResposta = temPerguntaSelecionada ? 
    respostas.map((item) => Resposta(item['texto'], () => _responder(item['nota']))).toList() : 
    null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App de Pergundas - udemy'),
        ),
        body: temPerguntaSelecionada ? Questionario(
            pergunta: _perguntas[_perguntaSelecionada]['texto'], 
            respostas: widgetsResposta
          ): Resultado(
            pontuacao: _scoreTotal, 
            aoReiniciarQuestionario: _reiniciarQuestionario,
          )
      )
    );


  }



}

class PerguntaApp extends StatefulWidget {

  
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }



}