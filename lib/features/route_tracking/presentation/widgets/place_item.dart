import 'package:flutter/material.dart';

import '../../data/models/place_model/place_model.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem({
    super.key,
    required this.prediction,
  });

  final Prediction prediction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.location_on_outlined),
        trailing: const Icon(Icons.arrow_forward_ios),
        title: Text(
          prediction.description!,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        ));
  }
}
