import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmerComment extends StatelessWidget{

    @override
    Widget build(BuildContext context) {
        
        return Shimmer.fromColors(
            baseColor: const Color.fromARGB(43, 158, 158, 158),
            highlightColor: const Color.fromARGB(21, 245, 245, 245),
            child: Container(
              width: double.infinity,
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          );

    }
    
}