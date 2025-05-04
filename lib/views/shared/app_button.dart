import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm/core/app_theme.dart';

class AppButton extends StatelessWidget {

    String title;
    Function() onPressed;
    AppButton({required this.onPressed,required this.title});

    @override
    Widget build(BuildContext context) {
        return MaterialButton(
            onPressed: onPressed,
            height: 55,
            padding: EdgeInsets.zero,
            child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: (Theme.of(context).brightness == Brightness.dark) ? Colors.white : ColorAppThemeData.darkPrimary)
                ),
                child: Center(child: Text(title),),
            ),
        );
    }

}