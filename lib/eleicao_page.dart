import 'package:flutter/material.dart';

class EleicaoPage extends StatefulWidget {
  const EleicaoPage({super.key});

  @override
  State<EleicaoPage> createState() => _EleicaoPageState();
}

class _EleicaoPageState extends State<EleicaoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eleição para representante'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
                'Escolha um candidato ou opte por voto em branco ou nulo:'),
            Image.asset(
              'assets/images/candidato_1.jpg',
              fit: BoxFit.cover,
              height: 200,
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text('Finalizar votação'))
          ],
        ),
      ),
    );
  }
}
