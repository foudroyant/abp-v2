import 'package:flutter/foundation.dart';
import '../utils/data.dart';

class Institut_Model with ChangeNotifier {


  void changeNom(String nom){
    //this.institut.setNom(nom);
    notifyListeners();
  }
}