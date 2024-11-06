import 'package:flutter/material.dart';

import '../../../Constant/Colors.dart';
class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      child: Form(
        child: TextFormField(
          onChanged: (value) {},
          decoration: InputDecoration(
            filled: true,
            hintStyle: TextStyle(color: HomeTextfieldLabelColor),
            fillColor: SearchTextfieldFillColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            labelStyle: TextStyle(color: HomeTextfieldLabelColor),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide.none,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide.none,
            ),
            suffixIcon: Icon(Icons.mic_none,color: HomeTextfieldIconColor,),
            hintText: "Search any Product",
            prefixIcon: Icon(Icons.search,color: HomeTextfieldIconColor,),
          ),
        ),
      ),
    );
  }
}
