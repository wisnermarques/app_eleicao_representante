import 'package:flutter/material.dart';

class EleicaoPage extends StatefulWidget {
  const EleicaoPage({super.key});

  @override
  State<EleicaoPage> createState() => _EleicaoPageState();
}

class _EleicaoPageState extends State<EleicaoPage> {
  List candidatos = [0, 0, 0, 0, 0]; //candidatos[1]

  resultado() {
    int maiorValor = candidatos
        .reduce((atual, proximo) => atual > proximo ? atual : proximo);

    List indicesVencedores = [];
    for (int i = 0; i < candidatos.length; i++) {
      if (candidatos[i] == maiorValor) {
        indicesVencedores.add(i);
      }
    }
    // Retorna todos os índices onde o maior valor aparece
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Votação Encerrada'),
            content: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Alinhar à esquerda
              mainAxisSize: MainAxisSize.min, // Minimizar a altura da coluna
              children: [
                for (int i = 0; i < candidatos.length; i++)
                  if (i == 3)
                    Text('Votos brancos: ${candidatos[i]}')
                  else if (i == 4)
                    Text('Votos nulos: ${candidatos[i]}')
                  else
                    Text('Candidato ${i + 1}: ${candidatos[i]}')
              ],
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eleição para representante'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                  'Escolha um candidato ou opte por voto em branco ou nulo:'),
              Wrap(
                children: [
                  InkWell(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/candidato_1.jpg',
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                        const Text('Candidato 1'),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        candidatos[0] = candidatos[0] + 1;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  InkWell(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/candidato_2.jpg',
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                        const Text('Candidato 2'),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        candidatos[1] = candidatos[1] + 1;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  InkWell(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/candidato_3.jpg',
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                        const Text('Candidato 3'),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        candidatos[2] = candidatos[2] + 1;
                      });
                    },
                  ),
                ],
              ),
              Wrap(
                children: [
                  InkWell(
                    child: const Column(
                      children: [
                        Icon(
                          Icons.block,
                          size: 200,
                        ),
                        Text('Nulo'),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        candidatos[3] = candidatos[3] + 1;
                      });
                    },
                  ),
                  InkWell(
                    child: const Column(
                      children: [
                        Icon(
                          Icons.how_to_vote,
                          size: 200,
                        ),
                        Text('Branco'),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        candidatos[4] = candidatos[4] + 1;
                      });
                    },
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    resultado();
                  },
                  child: const Text('Finalizar votação'))
            ],
          ),
        ),
      ),
    );
  }
}
