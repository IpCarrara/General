import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

class RolarDado extends StatefulWidget {
  const RolarDado({super.key});

  @override
  State<RolarDado> createState() {
    return _RolarDadoState();
  }
}

class _RolarDadoState extends State<RolarDado> {
  bool dadoClicado = false;
  var dadoEscolhidoSalvar = '';
  late int quantidade;
  var dadoEscolhidoRemover = '';

  late List<String> dadosAtivos;
  late List<String> copiaDadosAtivos;
  List<String> listaDadosEscolhidos = [];
  List<String> listaInicial = [];
  late int botaoClicadoQuantidade;

  @override
  void initState() {
    super.initState();
    quantidade = 5;
    dadosAtivos = List.generate(
      quantidade,
      (index) => 'assets/images/dice-5.png',
    );
    copiaDadosAtivos = List.from(dadosAtivos);
    botaoClicadoQuantidade = 0;
  }

  rolarTodosDados() {
    setState(() {
      dadosAtivos = List.generate(quantidade, (index) {
        var rolar = Random().nextInt(6) + 1;
        return 'assets/images/dice-$rolar.png';
      });
      copiaDadosAtivos = List.from(dadosAtivos);
      botaoClicadoQuantidade = botaoClicadoQuantidade + 1;
    });
  }

  void dadoEscolhido(int index) {
    setState(() {
      dadoClicado = true;
      dadoEscolhidoSalvar = copiaDadosAtivos[index];
      quantidade = quantidade - 1;
      copiaDadosAtivos.removeAt(index);
      listaDadosEscolhidos.add(dadoEscolhidoSalvar);
    });
  }

  void voltarDadoEscolhido(int index) {
    setState(() {
      dadoEscolhidoRemover = listaDadosEscolhidos[index];
      quantidade = quantidade + 1;
      listaDadosEscolhidos.removeAt(index);
      copiaDadosAtivos.add(dadoEscolhidoRemover);
    });
  }

  void novoJogo() {
    setState(
      () {
        quantidade = 5;
        dadosAtivos = List.generate(
          quantidade,
          (index) {
            var rolar = Random().nextInt(6) + 1;
            return 'assets/images/dice-$rolar.png';
          },
        );
        copiaDadosAtivos = List.from(dadosAtivos);
        listaDadosEscolhidos = [];
        botaoClicadoQuantidade = 1;
      },
    );
  }

  Future<void> showTemporaryImage(
      BuildContext context, String imagePath) async {
    Completer<void> completer = Completer<void>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 1)).then((_) {
          Navigator.of(context).pop();
          completer.complete();
        });

        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Image.asset(imagePath),
        );
      },
    );

    await completer.future;
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 8.0,
          children: List.generate(listaDadosEscolhidos.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  voltarDadoEscolhido(index);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                  shadowColor: Colors.black,
                  elevation: 5,
                ),
                child: Image.asset(
                  listaDadosEscolhidos[index],
                  width: 70,
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 60),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8.0,
          children: List.generate(quantidade, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  dadoEscolhido(index);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                  shadowColor: Colors.black,
                  elevation: 5,
                ),
                child: Image.asset(
                  dadoClicado == true
                      ? copiaDadosAtivos[index]
                      : dadosAtivos[index],
                  width: 100,
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 20),
        botaoClicadoQuantidade >= 3 || copiaDadosAtivos.isEmpty
            ? TextButton(
                onPressed: () async {
                  await showTemporaryImage(
                      context, 'assets/images/imagem_temporaria.gif');
                  novoJogo();
                },
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 225, 233, 0),
                  textStyle: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                child: const Text(
                  'Novo Jogo',
                ),
              )
            : TextButton(
                onPressed: () async {
                  await showTemporaryImage(
                      context, 'assets/images/imagem_temporaria.gif');
                  rolarTodosDados();
                },
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 225, 233, 0),
                  textStyle: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                child: const Text(
                  'Rolar Dado',
                ),
              ),
      ],
    );
  }
}
