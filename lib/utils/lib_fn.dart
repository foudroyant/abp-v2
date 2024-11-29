// Fonction qui retourne une couleur selon l'état
import 'dart:ui';
import 'package:flutter/material.dart';
import 'data.dart';

Color getColorForEtat(Etat etat) {
  switch (etat) {
    case Etat.DISPONIBLE:
      return Color(0xF71ABC43); // Vert pour DISPONIBLE
    case Etat.INDISPONIBLE:
      return Color(0xFF9B9B9B); // Rouge pour INDISPONIBLE
    case Etat.ANNULE:
      return Color(0xF7FC4004); // Gris pour ANNULE
    case Etat.HC:
      return Colors.white; // Orange pour HC (Hors Couverture)
    case Etat.RESERVE:
      return Color(0xF7CD9912); // Bleu pour RESERVE
    default:
      return Color(0xF71ABC43); // Couleur par défaut (DISPONIBLE) si l'état est inconnu
  }
}