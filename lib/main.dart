import 'package:flutter/material.dart';
import 'package:dado/container_fundo_gradient.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (fn) {
      runApp(
        const MaterialApp(
          home: Scaffold(
            body: ContainerFundoGradient(
              Color.fromRGBO(10, 165, 15, 1),
              Color.fromRGBO(9, 127, 13, 1),
            ),
          ),
        ),
      );
    },
  );
}
