import 'package:flutter/foundation.dart';
import '../utils/data.dart';

class Institut_Model with ChangeNotifier {
  late InstitutModel institut;

  init(InstitutModel institut){
    this.institut = institut;
    notifyListeners();
  }

  void changeNom(String nom){
    this.institut.setNom(nom);
    notifyListeners();
  }
}