// ignore: file_names

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = _controllerAlcool.text.contains(",")
        ? double.tryParse(_controllerAlcool.text.replaceAll(",", "."))
        : double.tryParse(_controllerAlcool.text);

    double? precoGasolina = _controllerGasolina.text.contains(",")
        ? double.tryParse(_controllerGasolina.text.replaceAll(",", "."))
        : double.tryParse(_controllerGasolina.text);

    double? resultado = precoAlcool! / precoGasolina!;

    setState(() {
      _textoResultado = resultado >= 0.7
          ? "Melhor abastecer com Gasolina"
          : "Melhor abastecer com álcool";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ácool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Image.asset("images/logo.png"),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                    "Saiba qual a melhor opção para abastecimento do seu Carro",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: "Preço Alcool, ex 4.33"),
                style: const TextStyle(fontSize: 22),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Preço Gasolina, ex: 7.00"),
                style: const TextStyle(fontSize: 22),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  child: const Text(
                    "Calcular",
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    primary: Colors.blue,
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: _calcular,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
