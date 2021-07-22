import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String selectedLocation;
  LocationWidget({required this.selectedLocation});

  @override
  Widget build(BuildContext context) {
    return Text(
      selectedLocation,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
