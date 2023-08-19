import 'package:ubenwa_kelvin/features/dashboard/model/bar_class.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;
  final double oneAmount;
  final double twoAmount;
  final double thrAmount;
  final double forAmount;
  final double fivAmount;
  final double sixAmount;

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.friAmount,
    required this.satAmount,
    required this.oneAmount,
    required this.twoAmount,
    required this.thrAmount,
    required this.fivAmount,
    required this.sixAmount,
    required this.forAmount,
  });

  List<BarClass> barData = [];

  void initializedData() {
    barData = [
      BarClass(x: 0, y: sunAmount),
      BarClass(x: 1, y: tueAmount),
      BarClass(x: 2, y: wedAmount),
      BarClass(x: 3, y: thuAmount),
      BarClass(x: 4, y: friAmount),
      BarClass(x: 5, y: satAmount),
      BarClass(x: 6, y: oneAmount),
      BarClass(x: 7, y: twoAmount),
      BarClass(x: 8, y: thrAmount),
      BarClass(x: 9, y: forAmount),
      BarClass(x: 10, y: fivAmount),
      BarClass(x: 11, y: sixAmount),
    ];
  }
}

List<double> barchartSumary = [
  4.40,
  2.50,
  42.50,
  5.86,
  64.45,
  8.99,
  64.45,
  8.99,
  42.50,
  5.86,
  64.45,
  8.99,
  8.99,
];
