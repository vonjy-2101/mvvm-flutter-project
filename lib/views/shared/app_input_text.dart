import 'package:flutter/material.dart';

class AppInputText extends StatelessWidget {

    TextEditingController controller;
    int? max;
    String? hintText;

    AppInputText({required this.controller, this.max, this.hintText});

    @override
    Widget build(BuildContext context) {
        
        return TextFormField(
            controller: controller,
            decoration: InputDecoration(
                hintText: hintText ?? "What'is your mind ?",
                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                fillColor : Colors.black26,
                focusColor: Colors.black26,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color: (Theme.of(context).brightness == Brightness.dark) ? Colors.white30 : Colors.black38,
                    ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color: (Theme.of(context).brightness == Brightness.dark) ? Colors.white30 : Colors.black38,
                    ),
                ),
            ),
            maxLines: max ?? 1,
            keyboardType: TextInputType.multiline,
        );

    }
}