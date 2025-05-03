import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm/models/post_model.dart';

class CommentPostScreen extends ConsumerWidget{

    PostModel post;
    CommentPostScreen({required this.post});

    TextEditingController emailController = TextEditingController(text: '');
    TextEditingController titleController = TextEditingController(text: '');
    TextEditingController bodyController = TextEditingController(text: '');

    @override
    Widget build(BuildContext context, WidgetRef ref) {
        
        return Scaffold(
            appBar: AppBar(
                title: Text("New comment"),
            ),
            body: Container(
                child: SingleChildScrollView(
                    child: Column(
                        children: [
                            Container(
                                width: MediaQuery.sizeOf(context).width,
                                margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12)
                                ),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(post.title,style: GoogleFonts.abrilFatface(fontSize: 18,fontWeight: FontWeight.bold),),
                                        SizedBox(height: 10),
                                        Text(post.body),
                                    ],
                                ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                                padding: EdgeInsetsDirectional.symmetric(vertical: 20,horizontal: 10),
                                child: TextFormField(
                                    controller: emailController,
                                ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                                padding: EdgeInsetsDirectional.symmetric(vertical: 20,horizontal: 10),
                                child: TextFormField(
                                    controller: titleController,
                                ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                                padding: EdgeInsetsDirectional.symmetric(vertical: 20,horizontal: 10),
                                child: TextFormField(
                                    controller: bodyController,
                                ),
                            ),
                            SizedBox(height: 10,),
                        ],
                    ),
                ),
            ),
        );

    }

}