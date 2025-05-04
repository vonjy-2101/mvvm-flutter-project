import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm/models/post_model.dart';
import 'package:mvvm/views/shared/app_button.dart';

import '../shared/app_header.dart';
import '../shared/app_input_text.dart';

class CommentPostScreen extends ConsumerWidget{

    PostModel post;
    CommentPostScreen({required this.post});

    TextEditingController emailController = TextEditingController(text: '');
    TextEditingController titleController = TextEditingController(text: '');
    TextEditingController bodyController = TextEditingController(text: '');

    @override
    Widget build(BuildContext context, WidgetRef ref) {
        
        return Scaffold(
            appBar: AppHeader(titlePage: "Add comment",),
            body: Container(
                child: SingleChildScrollView(
                    child: Column(
                        children: [
                            SizedBox(height: 10,),
                            Container(
                                width: MediaQuery.sizeOf(context).width,
                                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(10)
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
                            Container(
                                width: MediaQuery.sizeOf(context).width,
                                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Column(
                                    children: [
                                        Padding(
                                            padding: EdgeInsetsDirectional.symmetric(vertical: 15),
                                            child: AppInputText(controller: emailController,hintText: "your@email.com",),
                                        ),
                                        Padding(
                                            padding: EdgeInsetsDirectional.symmetric(vertical: 5),
                                            child: AppInputText(controller: titleController,hintText: "Title",),
                                        ),
                                        Padding(
                                            padding: EdgeInsetsDirectional.symmetric(vertical: 15),
                                            child: AppInputText(controller: bodyController,hintText: "Write your comment here...",max: 3,),
                                        ),
                                        AppButton(onPressed: (){}, title: "Send comment")
                                    ],
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