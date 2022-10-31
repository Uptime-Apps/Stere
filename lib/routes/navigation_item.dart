import 'package:flutter/material.dart';

class NavigationItem {
  IconData icon;
  String label;
  String route;

  NavigationItem(this.route, {required this.icon, required this.label});
}
