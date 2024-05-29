import 'package:flutter/cupertino.dart';

const LinearGradient backgroundPrimary = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    CupertinoColors.systemBackground,
    Color.fromARGB(255, 205, 220, 246),
  ],
  stops: [0.5, 1.0],
);

const LinearGradient backgroundDark = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color.fromARGB(255, 4, 30, 60),
    Color.fromARGB(255, 4, 30, 60),
  ],
  stops: [0.1, 1.0],
);
