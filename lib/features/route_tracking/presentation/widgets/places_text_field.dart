import 'package:flutter/material.dart';
import 'package:google_map/core/extensions/media_query_extension.dart';

class PlacesTextField extends StatelessWidget {
  const PlacesTextField({super.key, required this.controller});

  final TextEditingController controller ;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller ,
      cursorHeight: 20 ,
      decoration: InputDecoration(
        
          contentPadding:
              EdgeInsets.symmetric(horizontal: context.width * 0.05),
          hintText: 'search places ...',
          hintStyle: const TextStyle(fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          fillColor: Colors.white,
          filled: true),
      
    );
  }
}
