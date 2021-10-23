//Aquí se mostraran todas las opciones del menú general
import 'package:flutter/material.dart';

class Option {
  Icon icon;
  String title;
  String subtitle;

  Option({required this.icon, required this.title, required this.subtitle});
}

final options = [
  Option(
    icon: const Icon(Icons.feed, size: 40.0, color: Colors.white),
    title: 'Autorización de trabajo',
    subtitle: '',
  ),
  Option(
    icon: const Icon(Icons.lock, size: 40.0, color: Colors.white),
    title: 'Análisis de trabajo seguro',
    subtitle: '',
  ),
  Option(
    icon: const Icon(Icons.escalator, size: 40.0, color: Colors.white),
    title: 'Lista de chequeo para trabajo en alturas',
    subtitle: '',
  ),
  Option(
    icon: const Icon(Icons.tungsten, size: 40.0, color: Colors.white),
    title: 'Lista de chequeo para trabajos eléctricos',
    subtitle: '',
  ),
  Option(
    icon: const Icon(Icons.local_shipping, size: 40.0, color: Colors.white),
    title: 'Preoperacional del vehículo',
    subtitle: '',
  ),
];
