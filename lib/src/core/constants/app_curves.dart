import 'package:flutter/animation.dart';

/// Curve di animazione personalizzate per l'app sportiva
class AppCurves {
  // === CURVE STANDARD ===
  static const Curve standard = Curves.easeInOut;
  static const Curve fast = Curves.easeOut;
  static const Curve slow = Curves.easeInOut;

  // === CURVE SPORTIVE (dinamiche e energiche) ===
  static const Curve sportEnergy = Curves.fastOutSlowIn;
  static const Curve explosive = Curves.bounceOut;
  static const Curve smooth = Curves.decelerate;
  static const Curve power = Curves.easeInCubic;

  // === CURVE UI ===
  static const Curve enter = Curves.easeOut;
  static const Curve exit = Curves.easeIn;
  static const Curve modal = Curves.fastOutSlowIn;
  static const Curve page = Curves.easeInOut;

  // === CURVE PERSONALIZZATE ===
  static const Curve elastic = Curves.elasticOut;
  static const Curve bounce = Curves.bounceOut;
  static const Curve overshoot = Curves.elasticOut;

  // === CURVE PER BOTTONI E INTERAZIONI ===
  static const Curve buttonPress = Curves.easeInOut;
  static const Curve ripple = Curves.easeOut;
  static const Curve tap = Curves.fastOutSlowIn;

  // === CURVE PER LOADING ===
  static const Curve loading = Curves.linear;
  static const Curve progress = Curves.easeOut;
  static const Curve pulse = Curves.easeInOut;

  // === CURVE PERSONALIZZATE SPORTIVE ===

  /// Curva che simula un movimento esplosivo da fermo
  static const Cubic sprint = Cubic(0.0, 0.0, 0.2, 1.0);

  /// Curva che simula il ritmo di una corsa costante
  static const Cubic steadyRun = Cubic(0.4, 0.0, 0.6, 1.0);

  /// Curva che simula un movimento fluido come il nuoto
  static const Cubic swim = Cubic(0.25, 0.46, 0.45, 0.94);

  /// Curva che simula la forza di un sollevamento pesi
  static const Cubic lift = Cubic(0.68, -0.55, 0.265, 1.55);

  /// Curva che simula un rimbalzo come nel basket
  static const Cubic bounceSport = Cubic(0.68, -0.6, 0.32, 1.6);

  /// Curva che simula movimenti yoga fluidi
  static const Cubic yoga = Cubic(0.23, 1, 0.32, 1);
}
