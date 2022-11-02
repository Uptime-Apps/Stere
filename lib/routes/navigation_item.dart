import 'package:flutter/material.dart';

class NavigationItem {
  IconData icon;
  String label;
  Widget view;

  NavigationItem(this.view, {required this.icon, required this.label});
}
