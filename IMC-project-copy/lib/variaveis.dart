import 'package:flutter/foundation.dart';
import 'dart:math';

class Dados {
  String nome;
  double peso;
  double altura;
  bool magreza = false;
  bool normal = false;
  bool sobrepeso = false;
  bool obesidade = false;
  bool obesidadeGrave = false;

  Dados(this.nome, this.peso, this.altura);

  funcEstado(double imc) {
    if (imc < 16) {
      magreza = true;
    } else if (imc < 18.5) {
      normal = true;
    } else if (imc < 24.9) {
      sobrepeso = true;
    } else if (imc < 29.9) {
      obesidade = true;
    } else {
      obesidadeGrave = true;
    }
  }
}

double imc(double peso, double altura) {
  print("Peso: $peso");
  print("Altura: $altura");

  double imcCalculator = peso / pow(altura / 100, 2);
  return imcCalculator;
}

class Tipos {
  String? ecto;
  String? meso;
  bool emagreceFacilmente;
  bool ergordacomfacilidade;

  Tipos(
      this.ecto, this.meso, this.emagreceFacilmente, this.ergordacomfacilidade);

  funcTipos(ecto, meso) {
    if (meso = !false) {
      return true;
    }
  }
}
