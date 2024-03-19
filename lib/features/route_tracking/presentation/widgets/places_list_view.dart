import 'package:flutter/material.dart';
import 'package:google_map/features/route_tracking/data/models/place_model/place_model.dart';

import 'place_item.dart';

class PlacesListView extends StatelessWidget {
  const PlacesListView(
      {super.key, required this.placeModel, required this.onTap});

  final PlaceModel placeModel;
  final Function(int) onTap;

  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                onTap(index);
              },
              child:
                  PlaceItem(prediction: placeModel.predictions![index])),
          separatorBuilder: (context, index) => const Divider(height: 0),
          itemCount: placeModel.predictions!.length),
    );
  }
}
