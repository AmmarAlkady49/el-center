import 'package:e_learning_app/core/di/dependency_injection.dart' as di;
import 'package:e_learning_app/el_center_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupGetIt();
  runApp(const ElCenterApp());
}
