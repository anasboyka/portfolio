import 'package:flutter/material.dart';

class PurchaseServices with ChangeNotifier {
  bool subscribedOneMonth;
  bool subscribedOneYear;
  PurchaseServices({
    this.subscribedOneMonth = false,
    this.subscribedOneYear = false,
  });
}
