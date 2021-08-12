import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SystemInformationStandards {
  //MECHANICS
  String getDateTime() {
    String formattedDate =
        DateFormat('yyyy-MM-dd-HH:mm:ss').format(DateTime.now());
    return formattedDate;
  }
}