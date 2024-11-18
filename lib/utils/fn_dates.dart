import 'package:intl/intl.dart';

List<DateTime> getDatesOfCurrentWeek(DateTime jour) {
  // Obtenir le premier jour de la semaine (lundi)
  int weekday = jour.weekday; // 1 = lundi, ..., 7 = dimanche
  DateTime firstDayOfWeek = jour.subtract(Duration(days: weekday - 1));

  // Générer toutes les dates de la semaine
  List<DateTime> dates = List.generate(7, (index) {
    return firstDayOfWeek.add(Duration(days: index));
  });

  return dates;
}
