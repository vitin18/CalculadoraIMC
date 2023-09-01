import 'package:flutter/material.dart';
import 'variaveis.dart';
import "package:imc_project/variaveis.dart";

class H extends StatefulWidget {
  final String nome;
  final double peso;
  final double altura;
  final double imcValue;

  const H({
    Key? key,
    required this.nome,
    required this.peso,
    required this.altura,
    required this.imcValue,
  }) : super(key: key);

  @override
  _HState createState() => _HState();
}

class _HState extends State<H> {
  MaterialStateProperty<Color> _getObesidadeGraveButtonColor(double imcValue) {
    if (imcValue >= 34.9) {
      return MaterialStateProperty.all<Color>(
          Colors.green); // Cor verde para Obesidade Grave
    } else {
      return MaterialStateProperty.all<Color>(
          Colors.red); // Cor vermelha para outros casos
    }
  }

  MaterialStateProperty<Color> _getObesidadeButtonColor(double imcValue) {
    if (imcValue >= 30 && imcValue < 34.9) {
      return MaterialStateProperty.all<Color>(
          Colors.green); // Cor verde para Obesidade
    } else {
      return MaterialStateProperty.all<Color>(
          Colors.red); // Cor vermelha para outros casos
    }
  }

  MaterialStateProperty<Color> _getSobrepesoButtonColor(double imcValue) {
    if (imcValue >= 25 && imcValue < 30) {
      return MaterialStateProperty.all<Color>(
          Colors.green); // Cor verde para Sobrepeso
    } else {
      return MaterialStateProperty.all<Color>(
          Colors.red); // Cor vermelha para outros casos
    }
  }

  MaterialStateProperty<Color> _getNormalButtonColor(double imcValue) {
    if (imcValue >= 18.5 && imcValue < 25) {
      return MaterialStateProperty.all<Color>(
          Colors.green); // Cor verde para Normal
    } else {
      return MaterialStateProperty.all<Color>(
          Colors.red); // Cor vermelha para outros casos
    }
  }

  MaterialStateProperty<Color> _getMagrezaButtonColor(double imcValue) {
    if (imcValue < 18.5) {
      return MaterialStateProperty.all<Color>(
          Colors.green); // Cor verde para Magreza
    } else {
      return MaterialStateProperty.all<Color>(
          Colors.red); // Cor vermelha para outros casos
    }
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
          "${widget.nome.split(" ")[0]}. Seu Imc é Seu IMC é ${widget.imcValue.toStringAsFixed(2)}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                "Obesidade Grave",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                "Você tem que melhorar sua saude",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero),
                                    minimumSize:
                                        MaterialStateProperty.all(Size(20, 20)),
                                    backgroundColor:
                                        _getObesidadeGraveButtonColor(widget
                                            .imcValue), // Use a função _getButtonColor
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 100,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset("lib/assets/obesity.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                "Obesidade",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                "Cuidado, você deve melhorar sua saúde",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero),
                                    minimumSize:
                                        MaterialStateProperty.all(Size(20, 20)),
                                    backgroundColor: _getObesidadeButtonColor(widget
                                        .imcValue), // Use a função _getButtonColor
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 100,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset("lib/assets/fat.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                "Sobrepeso",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                "Se aliemente melhor",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero),
                                    minimumSize:
                                        MaterialStateProperty.all(Size(20, 20)),
                                    backgroundColor: _getSobrepesoButtonColor(widget
                                        .imcValue), // Use a função _getButtonColor
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 100,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset("lib/assets/fat2.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                "Normal no Shape",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                "Ótimo continue assim",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero),
                                    minimumSize:
                                        MaterialStateProperty.all(Size(20, 20)),
                                    backgroundColor: _getNormalButtonColor(widget
                                        .imcValue), // Use a função _getButtonColor
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 100,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset("lib/assets/normal.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                "Magreza",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                "Você precisa se alimentar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero),
                                    minimumSize:
                                        MaterialStateProperty.all(Size(20, 20)),
                                    backgroundColor: _getMagrezaButtonColor(widget
                                        .imcValue), // Use a função _getButtonColor
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 100,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset("lib/assets/thin.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
