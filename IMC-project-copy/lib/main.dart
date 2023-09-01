import 'package:flutter/material.dart';
import 'variaveis.dart';
import 'dart:math';
import 'package:imc_project/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hello World',
      theme: ThemeData(),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  String title = 'Calculadora IMC';
  TextEditingController nome = TextEditingController();
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();

  double _calcular(double peso, double altura) {
    double imcCalculator = peso / pow(altura, 2);
    return imcCalculator;
  }

  bool _validarEntrada(String input) {
    final regex = RegExp(r'^\d{1,3}(\.\d+)?$');
    return regex.hasMatch(input);
  }

  double _formatAltura(String input) {
    double altura = double.tryParse(input.replaceAll(',', '.')) ?? 0.0;
    return altura;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: Colors.black,
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: nome,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Insira seu nome",
                hintText: "Nome",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: peso,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Insira seu peso",
                hintText: "kg",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: altura,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Insira sua altura em metros",
                hintText: "cm",
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (!_validarEntrada(peso.text) ||
                        !_validarEntrada(altura.text) ||
                        !altura.text.contains('.')) {
                      // ...
                    } else {
                      double pesoValor = double.tryParse(peso.text) ?? 0.0;
                      double alturaValor = _formatAltura(altura.text);
                      double imcValue = _calcular(pesoValor, alturaValor);

                      Dados pessoa = Dados(nome.text, pesoValor, alturaValor);
                      pessoa.funcEstado(imcValue);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => H(
                            nome: nome.text,
                            peso: pesoValor,
                            altura: alturaValor,
                            imcValue: imcValue,
                          ),
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
